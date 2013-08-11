class CreateTelephones < ActiveRecord::Migration
  def change
    create_table :telephones do |t|
      t.integer :pacient_id
      t.integer :ddd
      t.integer :number
      t.boolean :preferred

      t.timestamps
    end
  end
end
