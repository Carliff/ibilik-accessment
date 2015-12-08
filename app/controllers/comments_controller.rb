# Display new Comment form

get "/property/:property_id/comments/new" do
	@user = current_user
	@property = Property.find(params[:property_id])
	erb :'comment/new'
end

# Create new Comment

post "/property/:property_id/comments" do
	property = Property.find(params[:property_id])
	comment = property.comments.create(comment: params[:comment], user_id: current_user.id)
		# erb :'question/show'
		redirect to "/property/#{property.id}"
end