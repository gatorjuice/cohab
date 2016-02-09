class CreateUserPartnerships < ActiveRecord::Migration
  def change
    create_table :user_partnerships do |t|
      t.integer :user_id
      t.integer :partnership_id

      t.timestamps null: false
    end
  end
end
