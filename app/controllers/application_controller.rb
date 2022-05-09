class ApplicationController < ActionController::Base
  before_action :check_header
  before_action :check_footer
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def check_header
    @check_header = request.path == new_user_registration_path || request.path == new_user_session_path || request.path == user_registration_path ||
                    (params[:controller] == 'devise/sessions' && params[:action] == 'new')
  end


  def check_footer
    @check_footer = request.path == new_user_password_path || request.path == user_password_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :user_name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :address, :phone, :birthday])
  end
end
