class RecipesController < ApplicationController
  def index
  	@keyword = params[:keyword] || 'chocolate'
  	@results = Recipe.for @keyword
  end
end
