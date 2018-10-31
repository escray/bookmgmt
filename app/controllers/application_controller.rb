#
class ApplicationController < ActionController::Base
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  after_action :verify_authorized, except: [:index],
                                   unless: :devise_controller?
  after_action :verify_policy_scoped, only: [:index],
                                      unless: :devise_controller?

  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  def admin_required
    redirect_to '/', alert: 'You are not admin.' unless current_user.admin?
  end

  private

  def set_locale
    if params[:locale] &&
       I18n.available_locales.include?(params[:locale].to_sym)
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
  end

  def not_authorized
    redirect_to root_path, alert: '您没有操作权限'
  end

  def configure_permitted_parameters
    added_attrs = %i[username email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
