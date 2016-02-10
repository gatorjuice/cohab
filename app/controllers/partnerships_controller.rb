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
		@grouped_expenses = @expenses.group_by {|expense| expense.user.firstname }

		high_spender = @grouped_expenses.max_by { |k, v| v }
		low_spender = @grouped_expenses.min_by { |k, v| v }

		if @expenses.length > 0
			high_spender_total = 0
			high_spender[1].each do |expense|
				high_spender_total += expense.value
			end
			low_spender_total = 0
			low_spender[1].each do |expense|
				low_spender_total += expense.value
			end

			difference = high_spender_total - low_spender_total
			
			@summary_statement = "#{high_spender[0]} has outspent #{low_spender[0]} by $#{difference}"
		end
	end




	def add_member
		@user = User.new(
			firstname: params[:firstname],
			lastname: params[:lastname],
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
