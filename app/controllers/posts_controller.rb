class PostsController < ApplicationController
	#enable_sync
	respond_to :html, :json

	def new
		@category = Category.friendly.find(params[:category_id])
		#@c = Category.find(params[:category_id])
    	@post = @category.posts.new
    	@category_price = @category.price
	    if @category.id > 14
	    	@selected = @category.parent.id
	    else
	    	@selected = @category.id
	    end
	    if @category.id > 14
	    	@value = @category.name
	    end
	   
	    if @category.parent_id = 0
	    	@leftblock = Category.where(parent_id: @category.id)
	    end
	end

	def index
		@category = Category.friendly.find(params[:category_id])
		@feed_items = @category.posts.paginate(page: params[:page])
		@feed_items = @feed_items.where(city_id: params[:city_id]) if params[:city_id].present?
		@feed_items = @feed_items.where(status: params[:status]) if params[:status].present?
		@feed_items = @feed_items
	end

	def create
		@post = current_user.posts.build(post_params)
		@category = Category.friendly.find(params[:category_id])
		@category_price = @category.price
		if @category.parent_id = 0
			@leftblock = Category.where(parent_id: @category.id)
		end
		if @post.save
			flash[:success] = "Поздравляем Ваше задание опубликованно"
			sync_new @post
			redirect_to post_path @post
			User.includes(:categories, :roles).references(:categories, :roles).where(categories: {id: @post.category_id}, roles: { id: 4 }).pluck(:email).each do |email|
				Notifier.delay.deliver_posts(email, @post)
			end
		else
			render 'new'
		end
	end

	def update
		@post = Post.friendly.find(params[:id])
		if @post.update(post_params)
    		redirect_to @post
    	end
	end

	def edit
		@post = Post.friendly.find(params[:id])
	end

	def destroy
		@post = Post.friendly.find(params[:id])
		@post.destroy
		redirect_to mytasks_path
	end

	def show
		@post = Post.find_by_slug(params[:id])
		@feed_items = @post.responces.paginate(page: params[:page])
		@comments = @post.comments
		@post.count += 1
		@post.save
		@reviews = @post.reviews
		 respond_with(@post)
	end

	def post_all
		@posts = Post.all.paginate(page: params[:page])
		@posts = @posts.where(city_id: params[:city_id]) if params[:city_id].present?
		@posts = @posts.where(status: params[:status]) if params[:status].present?
		@posts = @posts.paginate(page: params[:page])
		respond_with(@posts)
	end


	def completed 
    	@post = Post.friendly.find(params[:id])
    	@post.status = 3
    	 if @post.save
    	 	track_activity @post.executor, @post, 'completed'
    		redirect_to post_path @post
    	end
  	end

  	def uncompleted 
    	@post = Post.friendly.find(params[:id])
    	@post.status = 4
    	 if @post.save
    	 	track_activity @post.executor, @post, 'uncompleted'
    		redirect_to post_path @post
    	end
  	end

  	def completedexecutor
  		@post = Post.friendly.find(params[:id])
  		@post.statusfromexecutor = 3
  		if @post.save
  			track_activity @post.user, @post, 'completed_executor'
  			redirect_to mymadetask_path(current_user)
  		end
  	end

  	def uncompletedexecutor
  		@post = Post.friendly.find(params[:id])
  		@post.statusfromexecutor = 4
  		if @post.save
  			track_activity @post.executor, @post, 'uncompleted_executor'
  			redirect_to mymadetask_path(current_user)
  		end
  	end

  	def executor_choose
  		@post = Post.friendly.find(params[:id])
  		@post.status = 2
		@post.update_attributes(params[:post])
    	redirect_to post_path @post
    	track_activity @post.executor, @post, 'executor_choose'
    	Notifier.delay.executor_choose(@post)
  	end

	private
  		def post_params
    	params.require(:post).permit(:finalcustomerprice, :finalexecutorprice, :phone, :count, :name, :content, :date, :time, :category_id, :price, :adress1, :adress2, :status, :executor_id, :city_id, reviews_attributes:[:id, :body, :post_id, :user_id, :negative, :for_user_id])
  	end
end