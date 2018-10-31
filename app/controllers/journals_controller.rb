#
class JournalsController < ApplicationController
  before_action :set_journal, only: %i[show edit update destroy]

  def index
    @journals = policy_scope(Journal).rank(:row_order)
                                     .page(params[:page]).per(10)
  end

  def show
    authorize @journal, :show?
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(journal_params)

    if @journal.save
      flash[:notice] = '刊物创建成功'
      redirect_to @journal
    else
      flash[:alert] = '刊物创建未成功'
      render :new
    end
  end

  def edit
    authorize @journal, :update?
  end

  def update
    authorize @journal, :update?
    if @journal.update(journal_params)
      flash[:notice] = '刊物更新成功'
      redirect_to @journal
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

  private

  def journal_params
    params.require(:journal)
          .permit(:name, :publisher, :interval, :amount,
                  :delivery, :description, :image, :shortname,
                  department_ids: [])
  end

  def set_journal
    @journal = Journal.find_by_shortname!(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '您所查看的外来资料不存在'
    redirect_to journals_path
  end
end
