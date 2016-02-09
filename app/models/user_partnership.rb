class UserPartnership < ActiveRecord::Base
	belongs_to :user
	belongs_to :partnership

	def total_spent
		sum = 0
		user.expenses.each do |expense|
			sum += expense.value
		end
		"$#{sum.round(2)}"
	end

end
