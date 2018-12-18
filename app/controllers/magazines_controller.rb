class MagazinesController < ApplicationController
  before_action :set_magazine, only: %i[show]
  skip_after_action :verify_authorized, :verify_policy_scoped

  def index
    @magazines = Magazine.all
  end

  def show; end

  private

  def set_magazine
    @magazine = Magazine.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '您所查看的杂志不存在'
    redirect_to magazines_path
  end
end
