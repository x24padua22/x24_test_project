class Blog < ActiveRecord::Base
	attr_accessible :title, :description

	has_many :users, :through => :owners
	has_many :posts, :dependent => :destroy
	has_many :owners, :dependent => :destroy

	validates :title, :description, :presence => true
	validates :title, :length => { :minimum => 6}
	validates :description, :length => { :minimum => 15}
end
