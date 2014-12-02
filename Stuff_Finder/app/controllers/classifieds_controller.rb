class ClassifiedsController < ApplicationController
	before_action :authenticate_user!, only: [:new]

	def new
		@classified = Classified.new
		@category = Category.new
	end

	def create
		@categories = Category.all
		@category = Category.new(category_safe_params)
		existing_cats = @categories.where(name: @category.name)
		if existing_cats.any? == true
			@classified = Classified.new(classified_safe_params.merge(user_id: current_user.id, category_id: existing_cats.first.id))
			@classified.save
		else
			@category.save
			@classified = Classified.new(classified_safe_params.merge(user_id: current_user.id, category_id: @category.id))
			@classified.save
		end
		if @classified.save
			redirect_to root_path
		else
			render :new
		end
	end

	def show
		@classified = get_classified
	end

	def search
		@classifieds = Classified.search_for(params[:q])
	end

	private

	def category_safe_params
		params.require(:category).permit(:name)
	end

	def classified_safe_params
		params.require(:classified).permit(:title, :description, :price)
	end

	def get_classified
		Classified.find(params[:id])
	end
	
end