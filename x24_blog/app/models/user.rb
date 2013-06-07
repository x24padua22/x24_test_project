class User < ActiveRecord::Base
	attr_accessible :name, :email_address, :password
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	has_many :blogs, :through => :owners
	has_many :posts, :dependent => :destroy
	has_many :messages, :dependent => :destroy
	has_many :owners, :dependent => :destroy

	validates 	:name,		:presence 	=> true,
  				:length		            => { :maximum => 50 }

 	validates	:email_address,		:presence	=> true,
  				:format		            => { :with => email_regex },
           		:uniqueness 	        => { :case_sensitive => false }

    validates 	:password, 	:presence => true,
  	   			:confirmation 	      => true,
  					:length			  => { :within => 6..40 }

  	# class method that checks whether the user's email and submitted_password are valid
	def self.authenticate(email, submitted_password)
	    user = find_by_email_address(email)

	    return nil if user.nil?
	    return user if user.password == submitted_password
	end				
end
