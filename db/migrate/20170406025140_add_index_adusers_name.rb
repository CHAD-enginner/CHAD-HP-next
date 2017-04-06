class AddIndexAdusersName < ActiveRecord::Migration[5.0]
  def change
    add_index :adusers, :name
  end
end
