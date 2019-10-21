class MagazinesController < ApplicationController
  before_action :set_magazine, only: %i[show]
  before_action :load_magazines, only: %i[index show]
  skip_after_action :verify_authorized, :verify_policy_scoped

  def index; end

  def show
    @issues = @magazine.issues.page(params[:page]).per(Settings.magazines.issue.limit)
  end

  private

  def set_magazine
    @magazine = Magazine.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '您所查看的杂志不存在'
    redirect_to magazines_path
  end

  def load_magazines
    @magazines = Magazine.all
  end
end
