class CreateTimeStudies < ActiveRecord::Migration[6.0]
  def change
    create_table :time_studies do |t|
      t.string :production_name
      t.string :serial_number
      t.integer :start_time
      t.integer :ending_time
      t.boolean :forgetting
      t.boolean :problem
      t.references :work, null: false, foreign_key: true

      t.timestamps
    end
  end
end
