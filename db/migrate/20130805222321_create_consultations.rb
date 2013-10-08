class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.integer :treatment_id
      t.datetime :date
      t.text :description
      t.boolean :canceled
      t.integer :canceled_reason

      t.timestamps
    end
  end
end
