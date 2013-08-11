class CreatePacients < ActiveRecord::Migration
  def change
    create_table :pacients do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :rg
      t.integer :cpf

      t.timestamps
    end
  end
end
