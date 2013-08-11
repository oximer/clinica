class CreateProceduretypes < ActiveRecord::Migration
  def change
    create_table :proceduretypes do |t|
      t.string :name
      t.integer :followup

      t.timestamps
    end
  end
end
