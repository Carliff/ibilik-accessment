# Display new Booking form

get "/property/:property_id/booking/new" do
	@user = current_user
	@property = Property.find(params[:property_id])
	erb :'property/new_booking'
end

# Create new Booking

post "/property/:property_id/booking" do
	property = Property.find(params[:property_id])
	booking = property.bookings.create(booking: params[:booking], property_id: params[:property_id], notes: params[:notes], user_id: current_user.id)
		redirect to "/property/#{property.id}"
end