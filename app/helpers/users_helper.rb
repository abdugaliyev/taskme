module UsersHelper
	def avatar_for(user, options = { size: 200 })
		if user.avatar.blank?
			image_tag('male80.png', size: options[:size])
		else
			image_tag(user.avatar.thumb, size: options[:size])
		end
	end

	def conversation_interlocutor(conversation)
		conversation.recipient == current_user ? conversation.sender : conversation.recipient
	 end

	def current_user?(user)
    user == current_user
  end
end