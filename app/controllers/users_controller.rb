class UsersController < ApplicationController

	def login
		@user = User.find_by_email(params[:email])
		if @user.password == params[:password]
			session[:current_user] = true
			redirect_to "/users/#{@user.id}"
		else
			redirect_to "/welcome"
		end
	end

	def logout
		session[:current_user] = nil
		redirect_to "/welcome"
	end

	def forgot_password
		@user = User.find_by_email(params[:email])
		random_password = Array.new(10).map { (65 + rand(58)).chr }.join
		@user.password = random_password
		@user.save!
		Mailer.create_and_deliver_password_change(@user, random_password)
	end

	def show
		@user = User.find(params[:id])
	end

end
