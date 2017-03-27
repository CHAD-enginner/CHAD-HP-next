class CreateAdusers < ActiveRecord::Migration[5.0]
  def change
    create_table :adusers do |t|
      t.string :name
      t.string :email
      t.string :adress
      t.string :phone
      t.string :avator
      t.references :adkisei
      t.string :role
      t.timestamps
    end
  end
end
