require 'httparty'

class Recipe 
	include HTTParty

	base_uri 'http://www.recipepuppy.com'
	default_params onlyImages: 1
	def self.for(keyword)
		get("/api", query: {q: keyword})
	end
end

p Recipe.for "chocolate"