#
require 'csv'
class Admin::DocsController < Admin::ApplicationController
  layout 'admin'

  before_action :set_doc, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :admin_required

  def index
    # @docs = Doc.includes(:journal).order('id DESC')
    #            .page(params[:page]).per(10)
    @q = Doc.includes(:journal).ransack(params[:q])
    @docs = @q.result.order('id DESC').page(params[:page]).per(10)

    if params[:status].present? && Doc::STATUS.include?(params[:status])
      @docs = @docs.by_status(params[:status])
    end

    if params[:journal_id].present? && Journal.find_by_id(params[:journal_id])
      @docs = @docs.by_journal(params[:journal_id])
    end

    @docs = @docs.by_status(params[:statuses]) if Array(params[:statuses]).any?

    if Array(params[:journal_ids]).any?
      @docs = @docs.by_journal(params[:journal_ids])
    end

    if params[:start_on].present?
      @docs = @docs.where('publish >= ?',
                          Date.parse(params[:start_on]).beginning_of_day)
    end

    if params[:end_on].present?
      @docs = @docs.where('publish <= ?',
                          Date.parse(params[:end_on]).end_of_day)
    end

    if params[:doc_id].present?
      # TODO: sub('，', ',') maybe put in front-end
      @docs = @docs.where(id: params[:doc_id].sub('，', ',').split(','))
    end

    respond_to do |format|
      format.html
      # TODO: chinese characters code
      format.csv do
        @docs = @docs.reorder('id ASC')
        csv_string = CSV.generate do |csv|
          csv << %w[资料序号 资料名称 出版时间 到刊时间 资料原号 资料份数
                    录入人员 录入时间
                    资料状态 私密程度 资料描述]
          @docs.each do |d|
            csv << [d.id, d.name, d.publish, d.receive, d.origin, d.amount,
                    d.editor.username, d.created_at.to_s(:ymd),
                    t(d.status, scope: 'doc_.status'),
                    t(d.level, scope: 'doc_.level'), d.description]
          end
        end
        send_data csv_string, filename: "doc-#{Time.now.to_s(:number)}.csv"
      end
      format.xlsx
    end

    @docs_all = Doc.all

    if @docs_all.any?
      # TODO: receive may be null
      dates = (@docs_all.order('receive ASC').first.receive.to_date..Date.today).to_a

      status_colors = { 'available' => '#FF6384', 'lend' => '#36A2EB' }

      @date_stat = {
        labels: dates,
        datasets: Doc::STATUS.map do |s|
          {
            label: I18n.t(s, scope: 'doc_.status'),
            data: dates.map do |d|
              @docs_all.by_status(s).where('receive >= ? AND receive <= ?',
                          d.beginning_of_day, d.end_of_day).count
            end,
            borderColor: status_colors[s]
          }
        end
      }


    end
  end

  def new
    @doc = Doc.new
    authorize @doc, :create?
    @doc.attachments.build
  end

  def show
    authorize @doc, :show?
    # TODO: state_id remove?
    @comment = @doc.comments.build(state_id: @doc.state_id)
  end

  def create
    @doc = Doc.new(doc_params)

    whitelisted_params = doc_params
    whitelisted_params.delete(:tag_names) unless policy(@doc).tag?

    @doc.attributes = whitelisted_params
    @doc.editor = current_user
    authorize @doc, :create?

    @doc.attachments.each do |att|
      att.doc = @doc
    end

    if @doc.save
      flash[:notice] = '新增资料成功'
      redirect_to admin_docs_path
    else
      flash[:alert] = '新增资料未成功12'
      render :new
    end
  end

  def edit
    authorize @doc, :update?
    @doc.attachments.build if @doc.attachments.empty?
  end

  def update
    authorize @doc, :update?
    if @doc.update(doc_params)
      flash[:notice] = '更新资料成功'
      redirect_to admin_docs_path
    else
      flash[:alert] = '更新资料未成功'
      render :edit
    end
  end

  def destroy
    authorize @doc, :destroy?
    @doc.destroy
    flash[:notice] = '资料删除成功'
    redirect_to admin_docs_path
  end

  def bulk_update
    total = 0
    if params[:commit] == I18n.t(:bulk_update)
      Array(params[:ids]).each do |doc_id|
        doc = Doc.find(doc_id)
        doc.status = params[:doc_status]
        total += 1 if doc.save
      end
      flash[:notice] = I18n.t(:bulk_update) + " #{total} 篇"
    elsif params[:commit] == I18n.t(:bulk_delete)
      Array(params[:ids]).each do |doc_id|
        doc = Doc.find(doc_id)
        doc.destroy
        total += 1
      end
      flash[:alert] = I18n.t(:bulk_delete) + " #{total} 篇"
    end

    redirect_to admin_docs_path
  end

  def import
    csv_string = params[:csv_file].read.force_encoding('utf-8')
    success = 0
    failed_records = []

    CSV.parse(csv_string) do |row|
      doc = Doc.new(name: row[0],
                    journal: Journal.find(row[1]),
                    description: row[2],
                    publish: row[3],
                    receive: row[4],
                    amount: row[5],
                    status: row[6],
                    origin: row[7],
                    editor_id: row[8],
                    level: row[9])
      if doc.save
        success += 1
      else
        failed_records << [row, registration]
        Rails.logger.info("#{row} ----> #{doc.errors.full_messages}")
      end

      flash[:notice] = "总共汇入 #{success} 笔，失败 #{failed_records.size} 笔"
      redirect_to admin_docs_path
    end
  end

  private

  def doc_params
    params.require(:doc)
          .permit(:origin, :name, :receive, :publish, :journal_id, :level,
                  :description, :editor, :amount, :tag_names, :status,
                  :remove_images,
                  images: [],
                  department_ids: [],
                  attachments_attributes: %i[id file file_cache
                                             description _destory])
  end

  def set_doc
    @doc = Doc.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '您所查看的外来资料不存在'
    redirect_to docs_path
  end
end
