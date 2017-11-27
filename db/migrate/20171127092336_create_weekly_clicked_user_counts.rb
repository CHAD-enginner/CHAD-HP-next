class CreateWeeklyClickedUserCounts < ActiveRecord::Migration[5.0]
  def change
    create_table :weekly_clicked_user_counts do |t|
      t.references :aduser, comment: 'クリックされたユーザーのid'
      t.integer :number_of_times, comment: 'ユーザーがクリックされた回数'
      t.timestamps
    end
  end
end
