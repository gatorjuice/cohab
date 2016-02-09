class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :user_id
      t.integer :partership_id
      t.decimal :value, precision: 6, scale: 2
      t.string :description

      t.timestamps null: false
    end
  end
end
