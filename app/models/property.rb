class Property < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	has_many :comments
	has_one :votes, as: :voteable
end