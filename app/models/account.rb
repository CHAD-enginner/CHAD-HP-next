class Account < ApplicationRecord
  enum gender: { male: 0, female: 1, other: 2 }

  has_one :ad_user
  has_many :event_logs

  def check_token_expired?
    # tokenの有効期限が切れていた場合、再びFBログインさせて、tokenを再発行する
    token_expire < Time.zone.now
  end
end
