class Sponsor < ActiveRecord::Base
	validates_presence_of :name
	before_validation :check_link
	default_scope :order => 'position'
	acts_as_list
	
	private
	def check_link
		unless link.blank?
			self.link = "http://"+link unless link =~ /^http:\/\//
		end
	end
end
