class Recipe 
    include HTTParty

	base_uri 'http://www.recipepuppy.com'
	format :json
	def self.for keyword
		get("/api", query: {q: keyword})['results']
	end
end
