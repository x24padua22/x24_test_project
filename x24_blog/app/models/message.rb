class Message < ActiveRecord::Base
	attr_accessible :user_id, :message

 	belongs_to :post
 	belongs_to :user

 	has_many :users

  	validates :message,  :presence => true
end
