class Post < ActiveRecord::Base

  sync :all
  sync_scope :ordered, -> { order(created_at: :desc) }

  extend FriendlyId
  friendly_id :name, use: :slugged
  
	NORMAL    = 1
  ACTIVE    = 2
  COMPLETED = 3
  UNCOMPLETED = 4
  UNADDED = 5

	STATUSES = {
    NORMAL    => 'Открыто для предложений',
    ACTIVE    => 'Выполняется',
    COMPLETED => 'Выполнено',
    UNCOMPLETED => 'Не выполнено',
    UNADDED => 'Не добавлен'
  }

  def status_name
    STATUSES[status]
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  has_many :reviews
  has_many :reviewfromexecutors
  has_many :comments, :as => :attachable, :dependent => :destroy
  has_many :responces
	belongs_to :user
	belongs_to :category
	belongs_to :executor, class_name: 'User', :foreign_key => 'executor_id'
  belongs_to :city
  #has_one :user


  default_scope -> { order('created_at DESC') }

    validates :content, :presence => { :message => "^Подробно опишите детали задания" }
    validates :name, :presence => { :message => "^Коротко сформулируйте задачу" }

    validates :adress1, :presence => { :message => "^Укажите адресс" }
    validates :date, :presence => { :message => "^Выберете дату" }
    validates :time, :presence => { :message => "^Укажите время" }
    validates :phone, :presence => { :message => "^Укажите телефон" }
     #validates :price, numericality: { only_integer: true }
end
