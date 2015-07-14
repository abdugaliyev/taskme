class UsersEcategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :ecategory
end
