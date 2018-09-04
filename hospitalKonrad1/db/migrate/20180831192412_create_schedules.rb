class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.time :start
      t.time :end
      t.date :date_schedule
      t.boolean :available
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
