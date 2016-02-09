class Partnership < ActiveRecord::Base
	has_many :user_partnerships
	has_many :users, through: :user_partnerships
	has_many :expenses

	
end
