module ApplicationHelper
	require 'redcloth'
  def hour_minute(date)
    date.strftime("%d.%m.%y - %H:%M")
  end

  def year_month_day(date)
    date.strftime("%d.%m.%Y")
  end

  def flash_messages
    messages = []
    flash.each do |key, msg|
			messages <<  content_tag( :span, msg, :id => key)
    end
    messages
  end
	
	def generate_error_messages( object )
		txt = ""
		object.errors.each_full do |error|
			txt << error+"<br/>"
		end
		txt
	end
	
	def textilize( text )
		RedCloth.new(text, [:filter_html]).to_html
	end

  def current(lang)
    {:controller=>controller.controller_name, :action => controller.action_name, :locale =>lang, :id=>params[:id]}
  end

end
