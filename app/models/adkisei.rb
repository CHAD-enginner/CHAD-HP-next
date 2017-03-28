class Adkisei < ApplicationRecord
  has_many :adusers
  validates :name, presence: true
  validates :text, presence: true
  validates :backimage, presence: true

  mount_uploader :backimage, ImageUploader
end
