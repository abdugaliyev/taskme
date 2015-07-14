class User < ActiveRecord::Base
  letsrate_rater
  letsrate_rateable "Качество", "Вежливость", "Цена"
  
	before_create :create_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  include ActiveModel::Validations
  validates :name, presence: true, length: { maximum: 50 }, on: :create
   validates :email, presence: true, on: :create
   validates :city_id, presence: true, on: :create
   validates :birthday, presence: true, on: :create
   validates :password, presence: true, on: :create
   validates :password_confirmation, presence: true, on: :create

  mount_uploader :avatar, AvatarUploader

  has_many :posts
  accepts_nested_attributes_for :posts
  has_many :responces
  has_many :comments, as: :attachable
  has_many :users_roles, dependent: :destroy
  has_many :roles, through: :users_roles
  has_many :executors, class_name: 'Post', foreign_key: 'executor_id'
  has_many :reviews
  has_many :reviewfromexecutors
  belongs_to :city
  has_many :verifications
  has_many :users_ecategories
  has_many :ecategories, through: :users_ecategories
  has_many :executors, class_name: 'Review', foreign_key: 'for_user_id'
  has_many :activities
  has_many :authors, class_name: 'Activity', foreign_key: 'author_id'
  has_many :conversations, class_name: 'Conversation', foreign_key: 'sender_id'
  has_many :reviewss, class_name: 'Review', foreign_key: 'for_user_id'
  has_many :categories, through: :users_categories
  has_many :users_categories

  
  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  def feed
    Post.where("user_id = ?", id)
  end

  def execute_posts
    Post.where("executor_id = ?", id)
  end

  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def protected_email
    self.email.gsub(/[^@](?=.*?@)/, ?x)
  end

  def full_name
    "#{name} #{last_name}"
  end

  def send_devise_notification(notification, *args)
    devise_mailer.delay.send(notification, self, *args)
  end

  extend FriendlyId
  friendly_id :name, use: :slugged

  def normalize_friendly_id(input)
      input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  private
    def create_role
      self.roles << Role.find_by_name(:customer)  
    end
end