class Ecategory < ActiveRecord::Base
	has_many :users_ecategories
  	has_many :users, through: :users_ecategories
  	belongs_to :parent, class_name: 'Ecategory', foreign_key: 'parent_id'

  	#extend FriendlyId
	#friendly_id :name, use: :slugged

	#def normalize_friendly_id(input)
    	#input.to_s.to_slug.normalize(transliterations: :russian).to_s
  	#end
end
