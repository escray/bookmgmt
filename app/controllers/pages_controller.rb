class PagesController < ApplicationController
  include Pundit
  skip_after_action :verify_authorized, :verify_policy_scoped
end
