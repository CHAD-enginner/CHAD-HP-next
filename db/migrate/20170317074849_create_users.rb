class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :adress
      t.string :phone
      t.string :avator
      t.references :kisei
      t.timestamps
    end
  end
end
