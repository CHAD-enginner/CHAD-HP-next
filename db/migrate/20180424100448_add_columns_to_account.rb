class AddColumnsToAccount < ActiveRecord::Migration[5.0]
  def change
    change_column :accounts, :graph_id, :bigint, null: true
    change_column :accounts, :first_name, :string, null: true
    change_column :accounts, :last_name, :string, null: true
    change_column :accounts, :gender, :integer, null: true
    change_column :accounts, :locale, :string, null: true
    change_column :accounts, :timezone, :float, null: true
    change_column :accounts, :profile_page_url, :string, null: true
    change_column :accounts, :profile_picture_url, :text, null: true
    change_column :accounts, :age_range_min, :integer, null: true
    change_column :accounts, :access_token, :text, null: true
    change_column :accounts, :token_expire, :datetime, null: true
    add_column :accounts, :uid, :string
    add_column :accounts, :providor, :integer
    add_column :accounts, :credential, :text
    add_column :accounts, :raw_info, :text
    add_index :accounts, [:providor, :uid], :unique => true
  end
end
