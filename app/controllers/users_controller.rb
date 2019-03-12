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

	get '/signup' do 
		erb :signup
	end

	post '/users' do 
		if params[:name] != "" && params[:email] != "" && params[:password] != ""
			@user = User.create(params)
			session[:user_id] = @user.id
			redirect '/users/#{@user.id}'
		else

	end

	get '/logout' do 
		session.clear 
		redirect '/'
	end


	get '/users/:id' do
		@user = User.find_by(id: params[:id])
		erb :'/users/show'
	end
end