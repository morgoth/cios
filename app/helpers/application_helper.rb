module ApplicationHelper
  def hour_minute(date)
    date.strftime("%d.%m.%y - %H:%M")
  end

  def year_month_day(date)
    date.strftime("%d.%m.%Y")
  end

  def flash_messages
    messages = ""
    flash.each do |key, msg|
      messages <<  content_tag(:div, msg, :id => key)
    end
    messages.html_safe
  end

  def generate_error_messages( object )
    object.errors.full_messages.inject("") do |msg, error|
      msg << error << "<br/>"
    end
  end

  def current(lang)
    params.merge(:locale => lang)
  end

  def markup(text)
    RedCloth.new(text, [:filter_html]).to_html.html_safe
  end
end
