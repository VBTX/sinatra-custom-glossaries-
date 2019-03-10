class UsersController < ApplicationController

	get '/login' do
	erb :login	
	end

	post '/login' do
	@user = User.find_by(email: params[:email])
	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"

	else

		puts "Your login information is incorrect"
		puts "If you don't have an account, please signup here:"

	end
end


	get '/users/:id' do
		"this will be the show route"
	end
end