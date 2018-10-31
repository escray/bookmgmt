#
class DocsController < ApplicationController
  before_action :set_journal
  before_action :set_doc, only: %i[show edit update destroy]

  def index
    @docs = Doc.all
  end

  def show
    authorize @doc, :show?
    @comment = @doc.comments.build(state_id: @doc.state_id)
  end

  def new
    @doc = @journal.docs.build
    authorize @doc, :create?
    @doc.departments = @journal.departments
    # 3.times { @doc.attachments.build }
    @doc.attachments.build
  end

  def create
    @doc = @journal.docs.new

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
      redirect_to [@journal, @doc]
    else
      flash[:alert] = '新增资料未成功'
      render :new
    end
  end

  def edit
    authorize @doc, :update?
  end

  def update
    authorize @doc, :update?
    if @doc.update(doc_params)
      flash[:notice] = '更新资料成功'
      redirect_to [@journal, @doc]
    else
      flash[:alert] = '更新资料未成功'
      render :edit
    end
  end

  def destroy
    authorize @doc, :destroy?
    @doc.destroy
    flash[:notice] = '资料删除成功'
    redirect_to @journal
  end

  private

  def doc_params
    params.require(:doc)
          .permit(:origin, :name, :receive, :publish, :journal_id, :level,
                  :description, :editor, :amount, :tag_names, :status,
                  attachments_attributes: %i[file file_cache],
                  department_ids: [])
  end

  def set_doc
    @doc = @journal.docs.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '您所查看的外来资料不存在'
    redirect_to docs_path
  end

  def set_journal
    # puts params[:journal_id]
    @journal = Journal.find_by_shortname!(params[:journal_id])
  end
end
