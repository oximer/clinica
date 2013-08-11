class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.integer :treatment_id
      t.datetime :date

      t.timestamps
    end
  end
end
