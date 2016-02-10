class Partnership < ActiveRecord::Base
	has_many :user_partnerships
	has_many :users, through: :user_partnerships
	has_many :expenses

	validates :name, uniqueness: true
	validates :name, length: { in: 6..32 }

	
end
