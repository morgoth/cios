class User < ActiveRecord::Base
	acts_as_authentic do |conf|
		#conf.validates_length_of_password_field_options :minimum=>3
		#conf.validates_length_of_password_confirmation_field_options :minimum => 3
	end
	has_many :posts
	
  def safe_delete
    transaction do
      destroy
      if User.count.zero?
        raise "Nie można usunąć ostatniego administratora"
      end
    end    
  end

end