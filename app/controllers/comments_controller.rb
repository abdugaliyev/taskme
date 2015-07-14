class CommentsController < ApplicationController
    authorize_resource
    
	def create
        @post = Post.friendly.find(params[:post_id])
		@comment = Comment.new(com_params)
        @comment.user = current_user
    	@comment.attachable = @post
        authorize! :add, @comment = @comment
    	if @comment.save
            track_activity @post.user, @comment, 'create'
            if @comment.parent_id.present?
                Notifier.delay.reply_comment(@comment)
            else
                Notifier.delay.new_comment(@comment)
            end
    		flash[:notice] = 'Ваш комментарий добавлен'
    	else
    		flash[:error] = 'Комментарий не добавлен'
    	end
    	redirect_to post_path (@post)
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to :back
    end

    rescue_from CanCan::AccessDenied do |exception|
    redirect_to howtobeexecutor_path, :alert => exception.message
  end

    private
        def com_params
        params.require(:comment).permit(:name, :parent_id, :lfr, :rqt, :body, :user_id, :attachable_id, :attachable_type)
    end
end
