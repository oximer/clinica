class CreateIndicateds < ActiveRecord::Migration
  def change
    create_table :indicateds do |t|
      t.integer :pacient_id
      t.integer :indication_id
      t.text :description

      t.timestamps
    end
  end
end
