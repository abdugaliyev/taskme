class Category < ActiveRecord::Base

	extend FriendlyId
	friendly_id :name, use: :slugged

	has_many :posts
	belongs_to :parent, class_name: 'Category', foreign_key: 'parent_id'
	has_many :users_categories
  	has_many :users, through: :users_categories

	def normalize_friendly_id(input)
    	input.to_s.to_slug.normalize(transliterations: :russian).to_s
  	end
end
