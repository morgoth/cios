class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :partners_index, :set_locale

  helper_method :current_user

  def authenticate_user!
    redirect_to root_path, error: "Sign in" unless current_user
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = session[:user_id] && User.find(session[:user_id])
  end

  private

  def partners_index
    @sponsor_partners = Partner.sponsor.ordered
    @assistance_partners = Partner.assistance.ordered
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
