class ResponcesController < ApplicationController
	load_and_authorize_resource
	
	def new
		@post = Post.friendly.find(params[:post_id])
		@responce = @post.responces.new(post_id:params[:post_id])
		@responce.user = current_user
	end

	def create
		@post = Post.friendly.find(params[:post_id])
		@responce = @post.responces.build(responce_params)
		@responce.user = current_user
		if @responce.save
			Notifier.delay.new_responce(@responce)
			track_activity @post.user, @responce, 'create'
      		flash[:success] = "Вы откликнулись на задание"
      		redirect_to post_path @post
  		else
    		render 'new'
  		end
	end

	#def show
		#@feed_items = @post.responces.paginate(page: params[:page])
	#end

	def destroy
		@responce = Responce.find(params[:id])
		@responce.destroy
		redirect_to post_path @responce.post
	end

	private

	def responce_params
		params.require(:responce).permit(:price, :comment, :post_id)
	end
end
