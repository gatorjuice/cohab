class AlterPartershipIdInExpenses < ActiveRecord::Migration
  def change
  	rename_column :expenses, :partership_id, :partnership_id
  end
end
