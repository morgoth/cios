class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :partners_index, :set_locale

  private

  def partners_index
    @sponsor_partners = Partner.sponsor.ordered
    @assistance_partners = Partner.assistance.ordered
  end

  def set_locale
    cookies[:cios_locale] = params[:locale] if params[:locale]
    I18n.locale = params[:locale] || cookies[:cios_locale] || I18n.default_locale
  end
end
