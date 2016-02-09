class User < ActiveRecord::Base
	has_many :user_partnerships
	has_many :partnerships, through: :user_partnerships
	has_many :expenses

	def name
		"#{firstname} #{lastname}"
	end
end
