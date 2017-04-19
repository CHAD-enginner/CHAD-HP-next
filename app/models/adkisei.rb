class Adkisei < ApplicationRecord
  has_many :adusers
  validates :name, presence: true
  validates :text, presence: true

  mount_uploader :backimage, ImageUploader

  def createtime
    self.created_at.to_s(:short)
  end

  def updatetime
    self.updated_at.to_s(:short)
  end

end
