class ReviewsController < ApplicationController

	def new
		@post = Post.friendly.find(params[:post_id])
    	@review = @post.reviews.new
    end

    # экшн для создания отзыва исполнителем 

    def new_review 
    	@post = Post.friendly.find(params[:id])
    	@review = @post.reviews.new
    end

	def create
		@post = Post.friendly.find(params[:post_id])
    	@review = @post.reviews.build(review_params)

    	if current_user.id == @post.user.id
    		@post.finalcustomerprice = @review.customer_price
    		@post.save
    	else
    		@post.finalexecutorprice = @review.executor_price
    		@post.save
    	end

    	if @review.save
    		flash[:success] = "Поздравляем Ваш отзыв добавлен"
    		if @review.status == 3 && current_user == @post.user
                track_activity @post.executor, @review, 'create'
                redirect_to completed_post_path(@post) and return
    		end

    		if @review.status == 4 && current_user == @post.user
    			redirect_to uncompleted_post_path(@post) and return
                track_activity @post.executor, @review, 'create'
    		end

    		if @review.status == 3 && current_user == @post.executor 
    			redirect_to completedexecutor_post_path(@post) and return
                track_activity @post.user, @review, 'create'
    		end

    		if @review.status == 4 && current_user == @post.executor 
    			redirect_to uncompletedexecutor_post_path(@post) and return
                track_activity @post.user, @review, 'create'
            end
        else
    		if current_user == @post.user
    			render 'new'
    	   end
        end
	end



	private

	def review_params
	   	params.require(:review).permit(:status, :customer_price, :executor_price, :negative, :post_id, :body, :user_id, :for_user_id).merge(:user_id => current_user.id)
	end
end