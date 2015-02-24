class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params
  # before_action :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include StoreHelper

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to store_url, :alert => exception.message
    puts 'hello'
  end

  protected

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:danger] =
            "#{params[:locale]} translation not available"
          logger.error flash.now[:danger]
        end
      end
    end
# This sets the locale from the params, but only if there is a locale in the params; otherwise, it leaves the current locale alone. Care is taken to provide a message for both the user and the administrator when there is a failure.
    def default_url_options
      { locale: I18n.locale }
    end
end
