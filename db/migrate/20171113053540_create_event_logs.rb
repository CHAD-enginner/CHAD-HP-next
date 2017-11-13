class CreateEventLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :event_logs do |t|
      t.integer :event_type, null: false
      t.references :account
      t.references :ad_user
      t.timestamps
    end
  end
end
