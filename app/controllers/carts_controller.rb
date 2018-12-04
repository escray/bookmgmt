class CartsController < ApplicationController
  skip_after_action :verify_authorized, :verify_policy_scoped
end
