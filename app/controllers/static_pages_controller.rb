class StaticPagesController < ApplicationController
enable_sync
  def home
    @posts = Post.order('id DESC').limit(8)
    #@feed_items = @feed_items.where('id > ?', params[:last_id]) if params[:last_id].present?
    render layout: false and return
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def help
  end

  def contact
  end

  def howitworks
  end
  
  def howtobeexecutor
  end

  def create_task
  end

  def alltasks
  end


  def mytasks
    @user = current_user
    @feed_items = current_user.feed.paginate(page: params[:page])
    @feed_items = @feed_items.where(city_id: params[:city_id]) if params[:city_id].present?
    @feed_items = @feed_items.where(status: params[:status]) if params[:status].present?
    @feed_items = @feed_items.where(category_id: params[:category_id]) if params[:category_id].present?
    @feed_items = @feed_items
  end

  def mymadetask
    @user = current_user
    @feed_items = current_user.execute_posts.paginate(page: params[:page])
    @feed_items = @feed_items.where(city_id: params[:city_id]) if params[:city_id].present?
    @feed_items = @feed_items.where(status: params[:status]) if params[:status].present?
    @feed_items = @feed_items.where(category_id: params[:category_id]) if params[:category_id].present?
    @feed_items = @feed_items
  end

  def about
  end

  def security
  end
end
