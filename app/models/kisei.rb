class Kisei < ApplicationRecord
  has_many :users
  validates :name, presence: true
  validates :text, presence: true
  validates :backimage, presence: true
end
