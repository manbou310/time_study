class CreateAddForms < ActiveRecord::Migration[6.0]
  def change
    create_table :add_forms do |t|
      t.string :production_name
      t.string :serial_number
      t.string :start_time
      t.string :ending_time
      t.boolean :forgetting
      t.boolean :problem
      t.references :work, null: false, foreign_key: true

      t.timestamps
    end
  end
end
