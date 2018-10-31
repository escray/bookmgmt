class Admin::DepartmentsController < ApplicationController
  skip_after_action :verify_authorized, :verify_policy_scoped
  layout 'admin'
  before_action :set_department, only: %i[show edit update destroy]

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def show; end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:notice] = '单位创建成功'
      redirect_to admin_departments_path
    else
      flash.now[:alert] = '单位创建未成功'
      render 'new'
    end
  end

  def edit; end

  def update
    if @department.update(department_params)
      flash[:notice] = '单位更新成功'
      redirect_to admin_department_path(@department)
    else
      flash[:warning] = '单位更新未成功'
      render :edit
    end
  end

  def destroy
    @department.destroy
    flash[:notice] = '单位删除成功'
    redirect_to admin_departments_path
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name)
  end
end
