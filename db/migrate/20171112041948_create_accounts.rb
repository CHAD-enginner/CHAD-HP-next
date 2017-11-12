class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.bigint :graph_id, null: false, limit: 20
      t.string :name, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :gender, null: false
      t.string :locale, null: false, default: 'js_JP'
      t.float :timezone, null: false
      t.string :profile_page_url, null: false
      t.text :profile_picture_url, null: false, limit: 65535
      t.integer :age_range_min, null: false, limit: 2
      t.text :access_token, null: false, limit: 65535
      t.datetime :token_expire, null: false
      t.timestamps
    end
  end
end
