class CategoriesController < ApplicationController
	load_and_authorize_resource

	def new
		@category = Category.new
	end

	def index
	end

	def show
		#@post = Post.find(params[:id])
		@category = Category.find(params[:id])
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			redirect_to @category
		else
			render 'new'
		end
	end

	def feed
		Post.where("category_id = ?", id)
	end

	private

	def category_params
	   params.require(:category).permit(:name)
	end
end
