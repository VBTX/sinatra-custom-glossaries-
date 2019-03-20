class GlossariesController < ApplicationController

	get '/glossaries/new' do 
		erb :'glossaries/new'
	end

	post '/glossaries' do
		redirect_if_not_logged_in
		if params[:title] != ""
			flash[:error] = "Glossary title was successfully added."
			@glossary = Glossary.create(title: params[:title], user_id: current_user.id)
			@glossaries << @glossary
			redirect "/glossaries/#{@glossary.id}"
		else
			flash[:error] = "Please enter a title"
			redirect '/glossaries/new'
		end
	end

	get '/glossaries' do 
		@glossaries = Glossary.all
		erb :'glossaries/index'
	end

	get '/glossaries/:id' do 
		set_glossary
		erb :'glossaries/show'
	end

	get "/glossaries/:id/edit" do
		set_glossary
		redirect_if_not_logged_in
			if authorized_to_edit?(@glossary)
				erb :'glossaries/edit'
			else
				redirect "users/#{current_user.id}"
			end
	end

	patch '/glossaries/:id' do 
		set_glossary
		redirect_if_not_logged_in
			if authorized_to_edit?(@glossary) && params[:title] != ""
				@glossary.update(title: params[:params])
				redirect "/glossaries/#{@glossary.id}"
			else
				redirect "users/#{current_user.id}"
			end
	end

	delete '/glossaries/:id' do 
		set_glossary
		if authorized_to_edit?(@glossary)
			@glossary.destroy
			flash[:message] = "Your glossary was successfully deleted."
			redirect "/glossaries"

		else
			redirect "/glossaries"
		end
	end

	private

	def set_glossary
		@glossary = Glossary.find(params[:id])
	end
end