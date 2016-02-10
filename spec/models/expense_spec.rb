require 'rails_helper'

describe Expense do

	it 'should be invalid without a numerical value' do
		expect(Expense.new(value: nil)).to_not be_valid
	end

	it 'should be valid with a user_id, partnership_id, and value' do
		@expense = Expense.new(
			user_id: 2,
			partnership_id: 2,
			value: 5
		)
		expect(@expense).to be_valid
	end

end