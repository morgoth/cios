class Sponsor < ActiveRecord::Base
	validates_presence_of :name, :link
	before_validation :check_link
	
	private
	def check_link
		self.link = "http://"+link unless link =~ /^http:\/\//
	end
end
