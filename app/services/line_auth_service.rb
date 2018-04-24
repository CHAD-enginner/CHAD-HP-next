class LineAuthService
  # lineログインで取得したデータを保存する処理を書いていく
  
  def initialize
    @account = Account.new
  end

  def auth_uri(request)
    # cookiesがない場合は、lineログインさせる
    # 開発環境の場合
    # ホストはその都度変える
    return "https://86d29464.ngrok.io/adminusers/auth/line" if Rails.env == "development"
    # 本番環境の場合
    "https://#{request.host}/adminusers/auth/line"
  end

  def get_line_profile(request)
    omuniauth = request.env['omniauth.auth']
    @account.providor = omuniauth['provider']
    @account.uid = omuniauth['uid']
    already_created_account = Account.find_by(uid: @account.uid)
    return already_created_account if already_created_account.present?
    omuniauth_info = omuniauth['info']
    @account.name = omuniauth_info['name']
    @account.profile_picture_url = omuniauth_info['image']
    omuniauth_credentials = omuniauth['credentials']
    @account.access_token = omuniauth_credentials['refresh_token']
    @account.token_expire = curl_expire(omuniauth_credentials['expires_at'])
    @account.credential = omuniauth_credentials.to_s
    @account.raw_info = omuniauth['extra'].to_s
    @account.hash_id = SecureRandom.uuid
    @account.save if @account.valid?
    return @account
  end

  private

  def curl_expire(expire)
    Time.current.since(expire) - 1.days    
  end
end
