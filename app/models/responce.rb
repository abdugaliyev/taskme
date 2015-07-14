class Responce < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	default_scope -> { order('created_at DESC') }

	validates :price, numericality: { only_integer: true, message: "^Только цифры" }
	validates :comment, presence: { message: "^Добавьте комментарий" }

end
