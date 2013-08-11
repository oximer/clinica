class CreateInsureds < ActiveRecord::Migration
  def change
    create_table :insureds do |t|
      t.integer :pacient_id
      t.integer :insurance_id

      t.timestamps
    end
  end
end
