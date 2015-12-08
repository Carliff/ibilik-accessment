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
	#@answers = @question.answers
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




