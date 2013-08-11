class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.integer :proceduretype_id
      t.integer :insurance_id
      t.string :name
      t.text :description
      t.float :value
      t.integer :followup

      t.timestamps
    end
  end
end
