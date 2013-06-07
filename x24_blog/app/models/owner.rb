class Owner < ActiveRecord::Base	
	attr_accessible :user_id, :blog_id
	
 	belongs_to :user
 	belongs_to :blog
end
