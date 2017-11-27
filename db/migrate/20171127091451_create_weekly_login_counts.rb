class CreateWeeklyLoginCounts < ActiveRecord::Migration[5.0]
  def change
    create_table :weekly_login_counts do |t|
      t.references :account
      t.integer :number_of_times
      t.timestamps
    end
  end
end
