class AddHashIdToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :hash_id, :string
  end
end
