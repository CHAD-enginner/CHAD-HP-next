class CreateWeeklyUserClickedCounts < ActiveRecord::Migration[5.0]
  def change
    create_table :weekly_user_clicked_counts do |t|
      t.references :account, comment: 'クリックしたアカウントのid'
      t.references :aduser, comment: 'クリックされたユーザーのid'
      t.integer :number_of_times, comment: 'アカウントがユーザーをクリックした回数'
      t.timestamps
    end
  end
end
