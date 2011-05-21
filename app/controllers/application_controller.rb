class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :partners_index, :set_locale
  layout :set_layout

  private

  def partners_index
    @sponsor_partners = Partner.sponsor.ordered
    @assistance_partners = Partner.assistance.ordered
  end

  def pjax?
    env['HTTP_X_PJAX'].present?
  end

  def set_locale
    cookies[:cios_locale] = params[:locale] if params[:locale]
    I18n.locale = params[:locale] || cookies[:cios_locale] || I18n.default_locale
  end

  def set_layout
    pjax? ? false : "application"
  end
end
