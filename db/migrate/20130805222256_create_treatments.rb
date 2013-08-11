class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.integer :pacient_id
      t.integer :procedure_id
      t.float :discount
      t.boolean :done

      t.timestamps
    end
  end
end
