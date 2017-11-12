class AddReferenceToAduser < ActiveRecord::Migration[5.0]
  def change
    add_reference :adusers, :account, foreign_key: true, comment: 'accountのid'
  end
end
