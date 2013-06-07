class Post < ActiveRecord::Base
	attr_accessible :user_id, :title, :content
  	
  	belongs_to :blog
 	belongs_to :user

 	has_many :users
 	has_many :blogs
 	has_many :messages, :dependent => :destroy
 	
 	validates :title, :content, :presence => true

end
