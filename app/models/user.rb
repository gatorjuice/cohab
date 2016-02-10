require 'bcrypt'

class User < ActiveRecord::Base

	include BCrypt

	has_many :user_partnerships
	has_many :partnerships, through: :user_partnerships
	has_many :expenses

	validates :email, uniqueness: true

	def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
	
	def name
		"#{firstname} #{lastname}"
	end

end
