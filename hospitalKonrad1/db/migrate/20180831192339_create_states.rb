class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :nameState
      t.string :description

      t.timestamps
    end
  end
end
