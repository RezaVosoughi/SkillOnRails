class CoursesController < ApplicationController
	def index
		if params[:name]
			require 'net/http'
			uri = URI('https://tiss.tuwien.ac.at/api/search/course/v1.0/quickSearch?searchterm='+params[:name])
			response = Net::HTTP.get(uri)
			my_hash = JSON.parse(response)
			@course = my_hash["results"]
		else
			@course = []
		end
	end
	
	def show
		require 'open-uri'
		@user = User.find(params[:detail_url])
		xml = Nokogiri::HTML(open(params[:detail_url]))
		@person.title =  xml.xpath("//*[@id='contentInner']").text
	end
end
