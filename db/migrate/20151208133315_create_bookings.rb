class CreateBookings < ActiveRecord::Migration
	def change
			create_table :bookings do |t|
      t.boolean :booking
      t.integer :user_id
      t.integer :voteable_id
      t.string :voteable_type
      t.timestamps null: false
    end
	end
end
