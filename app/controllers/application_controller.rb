 require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable  :sessions
    set :session_secret, "glossaries_rock"
    register Sinatra::Flash

  get "/" do
    if logged_in?
      redirect "/users/#{@current_user.id}"
    else
      erb :welcome
  end
  end

  helpers do 

  	def logged_in? 
  		!!current_user
  	end

  	def current_user
  		@current_user  = User.find_by(id: session[:user_id])

  	end

    def authorized_to_edit?(glossary)
      glossary.user == current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:error] = "You must be logged in to view the page."
        redirect '/'
      end
    end
  	
  end
end
end
