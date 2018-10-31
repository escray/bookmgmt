class Admin::ApplicationController < ApplicationController
  skip_after_action :verify_authorized, :verify_policy_scoped
  before_action :authorize_admin!

  layout 'admin'

  def index; end

  private

  def authorize_admin!
    authenticate_user!
    redirect_to root_path, alert: '只有管理员才可以登录管理界面' unless current_user.admin?
  end
end
