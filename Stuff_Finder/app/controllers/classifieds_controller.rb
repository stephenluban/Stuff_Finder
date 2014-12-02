class ClassifiedsController < ApplicationController
	before_action :authenticate_user!, only: [:new]

	def new
		@classified = Classified.new
	end

	def create
		@classified = Classified.new(params.require(:classified).permit(:title, :description, :price))
		@classified.save
		redirect_to root_path
	end

	def show
		@classified = Classified.find(params[:id])

end
