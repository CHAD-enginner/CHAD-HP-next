class User < ApplicationRecord
  belongs_to :kisei
  validates :name, presence: true
  validates :email, presence: true
  validates :adress, presence: true
  validates :phone, presence: true
  validates :avator, presence: true
  validates :kisei_id, presence: true
end
