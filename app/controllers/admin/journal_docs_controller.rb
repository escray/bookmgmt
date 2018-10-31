class Admin::JournalDocsController < ApplicationController
  layout 'admin'

  skip_after_action :verify_authorized, :verify_policy_scoped

  before_action :find_journal
  before_action :find_doc, only: %i[show edit update destroy]

  def index
    @docs = @journal.docs.order('id DESC').page(params[:page]).per(10)

    if params[:status].present? && Doc::STATUS.include?(params[:status])
      @docs = @docs.by_status(params[:status])
    end
  end

  def show
    @comment = @doc.comments.build
  end

  def edit; end

  ## TODO: if doc.apartments updates, doc.amount need update
  def update
    if @doc.update(doc_params)
      flash[:notice] = '更新资料成功'
      redirect_to journal_doc_path(@journal, @doc)
    else
      flash[:alert] = '更新资料未成功'
      render :edit
    end
  end

  def destroy
    @doc.destroy
    flash[:notice] = '资料删除成功'
    redirect_to admin_journal_docs_path
  end

  def new
    @doc = @journal.docs.build
    @doc.departments = @journal.departments
    @doc.amount = @journal.amount
    @doc.attachments.build
  end

  def create
    @doc = @journal.docs.new

    whitelisted_params = doc_params
    # whitelisted_params.delete(:tag_names)

    @doc.attributes = whitelisted_params
    @doc.editor = current_user
    @doc.items = []

    @doc.attachments.each do |att|
      att.doc = @doc
    end

    if @doc.save
      if @doc.departments.any? { |dept| dept.name == '资料处' }
        item = Item.new
        item.owner = '资料处'
        item.doc_id = @doc.id
        item.name = @doc.id.to_s + '-1'
        @doc.items.append(item)
      end
      @doc.save
      flash[:notice] = '新增资料成功'
      redirect_to journal_doc_path(@journal, @doc)
    else
      flash[:alert] = '新增资料未成功资料'
      render :new
    end
  end

  def bulk_update
    total = 0
    if params[:commit] == I18n.t(:bulk_update)
      Array(params[:ids]).each do |doc_id|
        # TODO: @journal
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
  end

  private

  def find_doc
    @doc = Doc.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '您所查看的外来资料不存在'
    redirect_to admin_journals_path
  end

  def find_journal
    @journal = Journal.find_by_shortname!(params[:journal_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '您所查看的外来资料不存在'
    redirect_to admin_journals_path
  end

  def doc_params
    params.require(:doc)
          .permit(:origin, :name, :receive, :publish, :journal_id, :level,
                  :description, :editor, :amount, :tag_names, :status,
                  :remove_images,
                  items: [],
                  images: [],
                  department_ids: [],
                  attachments_attributes: %i[id file file_cache
                                             description _destory])
  end
end
