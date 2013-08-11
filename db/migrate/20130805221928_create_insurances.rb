class CreateInsurances < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
