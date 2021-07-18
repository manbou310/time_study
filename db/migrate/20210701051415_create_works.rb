class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :date
      t.string :process_name
      t.references :user, null: false, foreign_key: true
      t.references :channel, null: false, foreign_key: true
      t.timestamps
    end
  end
end