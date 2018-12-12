class Admin::OrdersController < ApplicationController
  layout 'admin'
  skip_after_action :verify_authorized, :verify_policy_scoped
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @orders = Order.order('id DESC')
  end

  def show
    @order = Order.find(params[:id])
    @borrow_lists = @order.borrow_lists
  end
end
