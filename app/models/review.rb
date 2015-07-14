class Review < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :executor, class_name: 'User', foreign_key: 'for_user_id'
  default_scope -> { order('created_at DESC') }

  validates :body, presence: { message: "^Добавьте отзыв" }
end
