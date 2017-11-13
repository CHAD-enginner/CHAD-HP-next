class Account < ApplicationRecord
  has_one :ad_user

  def check_token_expire
    # tokenの有効期限が切れていた場合、再びFBログインさせて、tokenを再発行する
    FacebookAuthService.new.auth_uri if token_expire < Time.zone.now
  end
end
