class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.text :location
      t.string :event_type
      t.integer :capacity, :default => 0, null: false
      t.integer :organization_id
      t.string :status
      t.timestamps
    end
  end
end
