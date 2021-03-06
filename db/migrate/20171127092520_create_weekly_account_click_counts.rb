class CreateWeeklyAccountClickCounts < ActiveRecord::Migration[5.0]
  def change
    create_table :weekly_account_click_counts do |t|
      t.references :account, comment: 'クリックしたアカウントのid'
      t.integer :number_of_times, comment: 'アカウントがユーザーをクリックした回数'
      t.timestamps
    end
  end
end
