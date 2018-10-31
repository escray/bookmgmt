#
class Admin::UsersController < Admin::ApplicationController
  layout 'admin'
  before_action :set_user, only: %i[show edit update archive]
  before_action :set_journals, only: %i[new create edit update]

  def index
    @users = User.excluding_archived.order(:email)
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    build_roles_for(@user)

    if @user.save
      flash[:notice] = '新增用户成功'
      redirect_to admin_users_path
    else
      flash.now[:alert] = '新增用户未成功'
      render 'new'
    end
  end

  def edit; end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?

    User.transaction do
      @user.roles.clear
      build_roles_for(@user)

      if @user.update(user_params)
        flash[:notice] = '更新用户成功'
        redirect_to admin_users_path
      else
        flash.now[:alert] = '更新用户未成功'
        render 'edit'
        raise ActiveRecord::Rollback
      end
    end
  end

  def archive
    if @user == current_user
      flash[:alert] = '用户不能自我归档'
    else
      @user.archive
      flash[:notice] = '用户归档成功'
    end
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user)
          .permit(:email, :password, :is_admin, :username, :cname)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_journals
    @journals = Journal.order(:name)
  end

  def build_roles_for(user)
    role_data = params.fetch(:roles, [])
    role_data.each do |journal_id, role_name|
      if role_name.present?
        user.roles.build(journal_id: journal_id, role: role_name)
      end
    end
  end
end
