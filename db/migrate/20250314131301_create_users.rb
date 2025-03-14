class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, index: true
      t.string :password_digest
      t.string :name
      t.string :role
      t.boolean :is_active, :default => true
      t.timestamps
    end
  end
end
