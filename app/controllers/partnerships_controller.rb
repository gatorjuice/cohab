class PartnershipsController < ApplicationController

	def new
		
	end

	def create
		@partnership = Partnership.new(
			name: params[:name]
		)
		if @partnership.save
			redirect_to "/partnerships/#{@partnership.id}"
		end
	end

	def show
		@partnership = Partnership.find(params[:id])
	end




	def add_member
		@user = User.new(
			firstname: params[:firstname],
			lastname: params[:lastname],
			email: params[:email],
			password: ""
		)
		@user.save
		puts @user.id
		@user_partnership = UserPartnership.new(
		  user_id: @user.id,
		  partnership_id: params[:partnership]
		)
		@user_partnership.save
		redirect_to "/partnerships/#{params[:partnership]}"
	end
end
