class Account < ApplicationRecord
  enum gender: { male: 0, female: 1, other: 2 }

  has_one :ad_user
  has_many :event_logs

  def check_token_expired?
    # tokenの有効期限が切れていた場合、再びFBログインさせて、tokenを再発行する
    token_expire < Time.zone.now
  end

  def currently_logined?
    event_logs = self.event_logs.where(event_type: 0, created_at: today)
    # 最近ログインしていたらtrueを返す
    event_logs.last.created_at > Time.zone.now - 2.hours
  end

  private

  def today
    time = Time.zone.now
    time.beginning_of_day..time.end_of_day
  end
end
