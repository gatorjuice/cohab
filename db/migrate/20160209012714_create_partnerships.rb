class CreatePartnerships < ActiveRecord::Migration
  def change
    create_table :partnerships do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
