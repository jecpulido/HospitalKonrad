class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.integer :document
      t.string :name
      t.string :lastName
      t.integer :age
      t.integer :phone
      t.string :email
      t.string :address
      t.references :profesion, foreign_key: true

      t.timestamps
    end
  end
end
