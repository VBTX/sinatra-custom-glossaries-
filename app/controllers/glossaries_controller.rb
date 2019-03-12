class GlossariesController < ApplicationController
	get '/glossaries/new' do 
		erb :'glossaries/new'
	end

	post '/glossaries' do
		if !logged_in?
			redirect '/'
		end


		if params[:content] != ""
			@glossary = Glossary.create(title: params[:title], user_id: current_user.id)
			redirect "/glossaries/#{@glossary.id}"
		else
			redirect '/glossaries/new'
		end


	end

	#show and index routes

end