class CreateAdkiseis < ActiveRecord::Migration[5.0]
  def change
    create_table :adkiseis do |t|
      t.string :name, null: false
      t.string :text, null: false
      t.string :backimage
      t.timestamps
    end
  end
end
