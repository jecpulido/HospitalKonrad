class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :report
      t.integer :room
      t.references :schedule, foreign_key: true
      t.references :patient, foreign_key: true
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
