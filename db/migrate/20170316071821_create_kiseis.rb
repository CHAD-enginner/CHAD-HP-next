class CreateKiseis < ActiveRecord::Migration[5.0]
  def change
    create_table :kiseis do |t|
      t.string :name, null: false
      t.string :text, null: false
      t.timestamps
    end
  end
end
