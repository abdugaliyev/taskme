class Verification < ActiveRecord::Base
	belongs_to :user
	validates :first_name, presence: { message: "^Поле не может быть пустым" }
	validates :last_name, presence: { message: "^Поле не может быть пустым" }
	validates :second_name, presence: { message: "^Поле не может быть пустым" }
	validates :birthday, presence: { message: "^Поле не может быть пустым" }
	validates :phone, presence: { message: "^Поле не может быть пустым" }
	validates :tpname, presence: { message: "^Поле не может быть пустым" }
	validates :tprelation, presence: { message: "^Поле не может быть пустым" }
	validates :tpphone, presence: { message: "^Поле не может быть пустым" }
	validates :tp1name, presence: { message: "^Поле не может быть пустым" }
	validates :tp1relation, presence: { message: "^Поле не может быть пустым" }
	validates :tp1phone, presence: { message: "^Поле не может быть пустым" }
	validates :firstverification, presence: { message: "^Поле не может быть пустым" }
	validates :kzcitizen, presence: { message: "^Поле не может быть пустым" }
	validates :verificationinformright , presence: { message: "^Поле не может быть пустым" }
end
