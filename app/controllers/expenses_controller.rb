class ExpensesController < ApplicationController

	def create
		expense_description = params[:expense_description]
		price = expense_description.match(/\d+(?:[.,]\d+)?/).to_s.to_d
		description = expense_description.delete(price.to_s).strip
		@expense = Expense.new(
			user_id: params[:user],
			partnership_id: params[:partnership],
			value: price,
			description: description
		)
		p price
		puts description
		@expense.save
		redirect_to "/partnerships/#{params[:partnership]}"
	end

end
