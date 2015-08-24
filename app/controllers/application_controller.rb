class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  #config.i18n.default_locale = 'pt-BR'

  def set_locale
    I18n.locale = params[:locale] || "pt-BR"
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

end
