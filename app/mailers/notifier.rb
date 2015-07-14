class Notifier < ActionMailer::Base
  default from: "notification@taskme.kz"

  def new_responce(responce)
  	@responce = responce
  	@responce_user_name = @responce.user.name
  	@responce_post_name = @responce.post.name
  	@responce_price = @responce.price
  	@responce_post = @responce.post

  	mail(to: @responce.post.user.email, subject: "Новый отклик на Ваше задание" )
	end

	def new_comment(comment)
		@comment = comment
		@comment_post_name = @comment.attachable.name
		@comment_post = @comment.attachable
		@comment_user = @comment.user.name
		@comment_body = @comment.body
		mail(to: @comment.attachable.user.email, subject: "Новый комментарий к заданию" )
	end

	def review(review)
		@review = review
		mail(to: @comment.post.user.email, subject: "Новый отзыв" )
	end

	def executor_choose(post)
		@post = post
		@post_name = @post.name
		@post_phone = @post.phone
		@post_user_name = @post.user.name
		@post_url = @post
		mail(to: @post.executor.email, subject: "Вас выбрали исполнителем" )
	end

	def deliver_posts(email, post)
		@post = post
		@post_name = @post.name
		mail(to: email, subject: "Новое задание" )
	end

	def reply_comment(comment)
		@comment = comment
		@comment_user = @comment.user.name
		@comment_body = @comment.parent.body
		@comment_post_name = @comment.attachable.name
		@comment_post = @comment.attachable
		mail(to: @comment.parent.user.email, subject: "На Ваш комментарий ответили" )
	end
end
