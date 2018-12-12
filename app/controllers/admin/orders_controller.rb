class Admin::OrdersController < ApplicationController
  layout 'admin'
  skip_after_action :verify_authorized, :verify_policy_scoped
  before_action :authenticate_user!
  before_action :admin_required
  before_action :set_order, only: %i[show prepare cancel lend return]

  def index
    @orders = Order.order('id DESC')
  end

  def show
    @borrow_lists = @order.borrow_lists
  end

  def prepare
    @order.prepare!
    redirect_back fallback_location: admin_order_path
  end

  def cancel
    @order.cancel_order!
    redirect_back fallback_location: admin_order_path
  end

  def lend
    @order.lend!
    redirect_back fallback_location: admin_order_path
  end

  def return
    @order.return_book!
    redirect_back fallback_location: admin_order_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = ''
    redirect_to admin_orders_path
  end
end
