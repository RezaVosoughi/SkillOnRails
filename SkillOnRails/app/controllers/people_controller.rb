class PeopleController < ApplicationController
	def index
		if params[:name]
			require 'net/http'
			uri = URI('https://tiss.tuwien.ac.at/api/person/v21/psuche?q='+params[:name]+'&max_treffer=20')
			response = Net::HTTP.get(uri)
			my_hash = JSON.parse(response)
			@people = my_hash["results"]
		else
			@people = []
		end
	end
	
	def show
		require 'open-uri'
		@person = Person.new
		
		xml = Nokogiri::HTML(open('https://tiss.tuwien.ac.at/api/person/v21/id/'+params[:id]))
	
		@person.firstname =  xml.xpath("//firstname").text
		@person.lastname =  xml.xpath("//lastname").text
		@person.gender =  xml.xpath("//gender").text
		@person.title =  xml.xpath("//preceding_titles").text
		@person.image =  xml.xpath("//picture_uri").text
		@person.id = params[:id]
	end
	
	def favorites
		@people = []
		
		Favorite.where(user_id: current_user.id).each do |fav|
			@person = Person.new
			xml = Nokogiri::HTML(open('https://tiss.tuwien.ac.at/api/person/v21/id/'+fav.personId))
		
			@person.firstname =  xml.xpath("//firstname").text
			@person.lastname =  xml.xpath("//lastname").text
			@person.gender =  xml.xpath("//gender").text
			@person.title =  xml.xpath("//preceding_titles").text
			@person.image =  xml.xpath("//picture_uri").text
			@person.id = fav.personId
			
			@people << @person

		end
		
	
	end
	
	def add_to_favorites
		#current_user.add_favorite(params[:person_id])
		# redirect to shopping cart or whereever
		@favorite = Favorite.new(user_id:current_user.id, personId: params[:person_id])
		@favorite.personId = params[:person_id]
	 
		if !@favorite.save
			redirect_to '/people/'+params[:person_id], :action => 'show', :notice => "Already in your favorites."
		else
			redirect_to '/people/'+params[:person_id], :action => 'show', :notice => "Added to favorites."
		end
	end
	
	def remove_from_favorites
		Favorite.where(user_id: current_user.id, personId: params[:person_id]).destroy_all
		redirect_to '/favorites'
		
	end
	
end
