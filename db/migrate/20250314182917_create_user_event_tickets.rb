class CreateUserEventTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :user_event_tickets do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :ticket_id
      t.string :status
      t.timestamps
    end
  end
end
