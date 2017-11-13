class CreateEventLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :event_logs do |t|
      t.string :event_type, null: false
      t.references :account, null: false
      t.references :ad_user, null: false
      t.timestamps
    end
  end
end
