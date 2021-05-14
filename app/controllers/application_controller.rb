class ApplicationController < ActionController::Base
  before_action :authorize
  before_action :set_i18n_locale_from_parans
  protected
  
    def authorize
      unless authorize_non_html || User.find_by(id: session[:user_id])
        redirect_to login_url, notice: 'Please log in'
      end
    end

    def set_i18n_locale_from_parans
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def authorize_non_html
      if request.format == Mime[:HTML]
        return false
      end
      authenticate_or_request_with_http_basic('Application') do |name, password|
        return name == 'dave' && password == 'secret'
      end
    end
end
