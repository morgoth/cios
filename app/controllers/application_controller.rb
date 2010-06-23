class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user
  before_filter :ensure_domain
  before_filter :sponsors_index, :set_locale

  private

  def sponsors_index
    @sponsors = Sponsor.all
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def login_required
    unless current_user
      store_location
      flash[:notice] = t("login_required")
      redirect_to new_user_session_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def set_locale
    cookies[:cios_locale] = params[:locale] if params[:locale]
    I18n.locale = params[:locale] || cookies[:cios_locale]
  end

  def ensure_domain
    if Rails.env == 'production' and request.env['HTTP_HOST'] != 'kscios.pl'
      redirect_to "http://kscios.pl"
    end
  end
end
