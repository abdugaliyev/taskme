class Comment < ActiveRecord::Base
	acts_as_nested_set scope: :attachable

	belongs_to :attachable, polymorphic: true
	has_many :comments, as: :commentable
	belongs_to :user
	belongs_to :parent, class_name: 'Comment', foreign_key: 'parent_id'


	validates :body, :presence => { :message => "^А зачем пустой комментарий?" }

end