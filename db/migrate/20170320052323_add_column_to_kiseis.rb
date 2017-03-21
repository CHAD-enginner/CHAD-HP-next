class AddColumnToKiseis < ActiveRecord::Migration[5.0]
  def change
    add_column :kiseis, :backimage, :string
  end
end
