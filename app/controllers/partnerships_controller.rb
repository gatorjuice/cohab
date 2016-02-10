class PartnershipsController < ApplicationController

	def new
		@filler = "The Odd Couple"
	end

	def create
		@partnership = Partnership.new(
			name: params[:name]
		)
		if @partnership.save
			redirect_to "/partnerships/#{@partnership.id}"
		else
			@filler = "Must be at least 6 characters long."
			render :new
		end
	end

	def show
		@partnership = Partnership.find(params[:id])
		@expenses = Expense.where(partnership_id: @partnership.id).order(:created_at).reverse
	end




	def add_member
		@user = User.new(
			firstname: params[:firstname],
			lastname: params[:lastname],
			email: params[:email],
			password: ""
		)
		@user.save

		@user_partnership = UserPartnership.new(
		  user_id: @user.id,
		  partnership_id: params[:partnership]
		)
		@user_partnership.save
		redirect_to "/partnerships/#{params[:partnership]}"
	end
end
