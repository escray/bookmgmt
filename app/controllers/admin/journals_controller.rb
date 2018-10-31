class Admin::JournalsController < Admin::ApplicationController
  layout 'admin'
  before_action :set_journal, only: %i[show edit update destroy reorder]

  def index
    @journals = Journal.rank(:row_order).all
    @docs = Doc.all

    colors = ['rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)']

    status_colors = { "available" => "#FF6384", "lend" => "#36A2EB" }

    journal_names = @journals.map { |j| j.name }

    # @journal_stat = {
    #   labels: journal_names,
    #   datasets: [{
    #     label: '刊物期数',
    #     data: @journals.map { |t| t.docs.count },
    #     backgroundColor: colors,
    #     borderWidth: 1
    #              }]
    # }

    @journal_stat = {
      labels: journal_names,
      datasets: Doc::STATUS.map do |s|
        {
          label: I18n.t(s, scope: 'doc_.status'),
          data: @journals.map { |j| j.docs.by_status(s).count },
          backgroundColor: status_colors[s],
          borderWidth: 1
        }
      end
    }

  end

  def show; end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(journal_params)
    if @journal.save
      flash[:notice] = '刊物创建成功'
      redirect_to @journal
    else
      flash.now[:alert] = '刊物创建未成功'
      render :new
    end
  end

  def edit; end

  def update
    if @journal.update(journal_params)
      flash[:notice] = '刊物更新成功'
      redirect_to journal_path(@journal)
    else
      flash[:alert] = '刊物更新未成功'
      render :edit
    end
  end

  def destroy
    @journal.destroy

    flash[:notice] = '刊物删除成功'
    redirect_to journals_path
  end

  def reorder
    @journal.row_order_position = params[:position]
    @journal.save!

    redirect_to admin_journals_path
    respond_to do |format|
      format.html { redirect_to admin_journals_path }
      format.json { render json: { message: 'ok' } }
    end
  end

  private

  def journal_params
    params.require(:journal)
          .permit(:name, :publisher, :interval, :amount, :delivery,
                  :logo, :remove_logo,
                  :description, :shortname, department_ids: [])
  end

  def set_journal
    @journal = Journal.find_by_shortname!(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '您所查看的外来资料不存在'
    redirect_to journals_path
  end
end
