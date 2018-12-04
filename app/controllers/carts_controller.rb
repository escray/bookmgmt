class CartsController < ApplicationController
  skip_after_action :verify_authorized, :verify_policy_scoped

  def clean
    current_cart.clean!
    flash[:warning] = '已清空借书单'
    redirect_to carts_path
  end
end
