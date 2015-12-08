get '/' do
	@user = current_user
	@property = Property.all
	# @answers = Answer.all
  erb :"static/index"
end