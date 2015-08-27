class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || "pt-BR"
  end

  def after_sign_in_path_for(resource)
    edit_user_registration_path(current_user)
  end

end
