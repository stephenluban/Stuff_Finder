class HomeController < ApplicationController

	def index
		@classifieds = params[:q] ? Classified.search_for(params[:q]) : Classified.all
		@categories = Category.all
	end

end
