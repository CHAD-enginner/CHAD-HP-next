class CreateWeeklyClickedUserCounts < ActiveRecord::Migration[5.0]
  def change
    create_table :weekly_clicked_user_counts do |t|
      t.references :aduser
      t.integer :number_of_times
      t.timestamps
    end
  end
end
