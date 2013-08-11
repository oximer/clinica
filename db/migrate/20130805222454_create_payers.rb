class CreatePayers < ActiveRecord::Migration
  def change
    create_table :payers do |t|
      t.integer :payment_id
      t.integer :treatment_id
      t.datetime :date

      t.timestamps
    end
  end
end
