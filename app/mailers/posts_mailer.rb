class PostsMailer < ActionMailer::Base
  default from: "notification@taskme.kz"

  	def deliver_posts_register(email, user)
		@post = user
		@post_name = @post.name
		mail(to: email, subject: "Новое задание")
	end
end
