# Display new property form
get "/property/new" do
	@user = current_user
	erb :"property/new"
end


# Create new property

post "/property" do
	# byebug
	@user = current_user
	@property = Property.new(property_name: params[:property_name], property_address: params[:property_address], property_info: params[:property_info], property_price: params[:property_price], user_id: session[:user_id])

	if @property.save
		# erb :"/user/questions"
		redirect to "/property/#{@property.id}"
	else
		@warning = "Action failed, invalid or incomplete info, please retry"
		erb :"property/new"
	end
end


# View/Show the PROPERTY

get "/property/:id" do
	@user = current_user
	@property = Property.find(params[:id])
	@comments = @property.comments
	erb :'property/show'
end


# Display Edit Property form

get '/property/:id/edit' do
	@user = current_user
	@property = Property.find(params[:id])
	erb :'property/edit'
end

# Edit Property

patch '/property/:id' do
	@user = current_user
	property = Property.find(params[:id])
	property.update(property_name: params[:property_name], property_address: params[:property_address], property_info: params[:property_info], property_price: params[:property_price])
	redirect "/property/#{property.id}"
end

# Delete Property

delete '/property/:id' do
	@user = current_user
	property = Property.find(params[:id])
	property.destroy
	erb :'static/index'
end


# Booking True / False

# post '/property/:id' do
# 	@user = current_user
# 	@property = Property.find(params[:id])
# 	@comments = @property.comments

# 	booking = Booking.create(voteable: @property, user: current_user, booking: params[:booking])
# 	# if vote.valid?
#  #    flash[:notice] = "Your vote was counted."
#  #  else
#  #    flash[:error] = "You can only vote once."
#  #  end
# 	# erb :'question/show'
# 	redirect "/property/#{property.id}"
# end

# booking = @property.bookings.find_or_initialize_by(user_id: session[:user_id])
# 	if booking.id.nil?
# 		booking.destroy
# 	else
# 		booking.voteable_id = true
# 		booking.save
# 	end
# end

