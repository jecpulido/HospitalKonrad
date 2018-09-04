class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.integer :document
      t.string :name
      t.string :lastName
      t.integer :age
      t.integer :sex
      t.string :eps
      t.integer :phone
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
