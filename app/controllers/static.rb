get '/' do
	@user = current_user
	@property = Property.all
	# @owner = @property.user.id
	# @answers = Answer.all
  erb :"static/index"
end