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

	get '/glossaries/:id' do 
		set_glossary
		erb :'glossaries/show'
	end

	get "/glossaries/:id/edit" do
		set_glossary
		erb :'glossaries/edit'
	end

	patch '/glossaries/:id' do 
		set_glossary
		@glossary.update(params)
		redirect 
	end

	private

	def set_glossary
		@glossary = Glossary.find(params[:id])
	end

end