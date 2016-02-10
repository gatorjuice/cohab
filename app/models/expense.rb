class Expense < ActiveRecord::Base
	belongs_to :user
	belongs_to :partnership

	validates :value, numericality: { greater_than: 0 }
end
