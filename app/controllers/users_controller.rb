# User logout

get '/users/logout' do
	session[:user_id] = nil
	redirect '/'
end


# User login

post "/users/login" do
	User.connection
	user = User.authenticate(params[:email], params[:password])
	if user 
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		@warning = "Login failed, invalid details, please retry"
		erb :'user/index'
	end
end



# Display new user form
get '/users/new' do
	erb :"user/new"
end

# Create new user

post "/users" do
	# byebug
	user = User.new(params[:user])
	# @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

	if user.save
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		warning = "Sign up failed, invalid or incomplete info, please retry"
		# erb :'/user/new'
		redirect "/users/new"
	end
end


# View user profile

get '/users/:id' do
	@user = User.find(params[:id])
	erb :'user/show'
end

# Display Edit User form

get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :'user/edit'
end 

# Edit user

patch '/users/:id' do
	user = User.find(params[:id])
	user.update(name: params[:name], email: params[:email], password: params[:password])
	redirect "/users/#{user.id}"
end


# View login page

get '/login' do
	erb :'user/login'
end







