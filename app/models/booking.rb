class Booking < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user, class_name: 'User', foreign_key: 'user_id'
	belongs_to :voteable, polymorphic: true

	validates_uniqueness_of :user, scope: [:voteable_type, :voteable_id]
end