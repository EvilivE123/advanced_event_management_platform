class CreateConfigurationSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :configuration_settings do |t|
      t.string :name
      t.jsonb :value
      t.timestamps
    end
  end
end
