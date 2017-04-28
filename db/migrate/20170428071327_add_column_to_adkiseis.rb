class AddColumnToAdkiseis < ActiveRecord::Migration[5.0]
  def change
    add_column :adkiseis, :joining, :string
    add_column :adkiseis, :graduating, :string
  end
end
