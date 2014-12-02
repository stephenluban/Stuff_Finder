class HomeController < ApplicationController

	def index
		@classifieds = Classified.all
	end

end
