class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :trackable, polymorphic: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
