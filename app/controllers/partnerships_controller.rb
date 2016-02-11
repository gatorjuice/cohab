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

		puts "+++++++++++++++++++"
		@grouped_expenses = {}

		@expenses.each {|expense| @grouped_expenses[expense.user.firstname] = 0}

		@expenses.each do |expense|
			@grouped_expenses[expense.user.firstname] += expense.value
		end

		puts @grouped_expenses
		high_spender = @grouped_expenses.max_by { |k, v| v }
		low_spender = @grouped_expenses.min_by { |k, v| v }
		
		puts high_spender
		puts low_spender
		
		if @expenses.length > 0

			difference = high_spender[1] - low_spender[1]

			@summary_statement = "#{high_spender[0]} has outspent #{low_spender[0]} by $#{difference}"
		
		end
	end




	def add_member
		@user = User.new(
			firstname: params[:firstname].capitalize,
			lastname: params[:lastname].capitalize,
			email: params[:email]
			)
		@user.password = params[:password]
		@user.save!

		@user_partnership = UserPartnership.new(
			user_id: @user.id,
			partnership_id: params[:partnership]
			)
		@user_partnership.save
		redirect_to "/partnerships/#{params[:partnership]}"
	end
end
