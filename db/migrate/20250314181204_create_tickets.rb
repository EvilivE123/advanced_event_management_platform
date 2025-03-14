class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :event_id
      t.string :ticket_type
      t.integer :price, default: 0, null: false
      t.string :status
      t.timestamps
    end
  end
end
