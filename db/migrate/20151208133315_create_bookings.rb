class CreateBookings < ActiveRecord::Migration
	def change
			create_table :bookings do |t|
      t.boolean :booking
      t.integer :user_id
      t.integer :property_id
      t.string :notes
      
      t.timestamps null: false
    end
	end
end
