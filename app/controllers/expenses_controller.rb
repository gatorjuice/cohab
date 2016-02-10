class ExpensesController < ApplicationController

	def create
		expense_description = params[:expense_description]
		price = expense_description.match(/\d+(?:[.,]\d+)?/).to_s
		description = expense_description.delete(price).strip
		@expense = Expense.new(
			user_id: params[:user],
			partnership_id: params[:partnership],
			value: price,
			description: description
		)
		puts price
		puts description
		@expense.save
		redirect_to "/partnerships/#{params[:partnership]}"
	end

end
