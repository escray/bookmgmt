class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, :verify_policy_scoped

  def index
    @orders = current_user.orders.order('id DESC')
  end
end
