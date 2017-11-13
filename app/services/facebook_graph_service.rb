class FacebookGraphService
  REQUEST_USER_FIELDS = %w[
    id cover name first_name last_name age_range
    link gender locale picture timezone updated_time verified
  ].freeze

# expireがなかったらnilを格納する
  def initialize(token_info)
    @koala = Koala::Facebook::API.new(token_info[:access_token])
    @access_token = token_info[:access_token]
    # FBから返ってくるexpireは、発行された時から何秒後に
    # tokenが期限切れになるのかを示す
    @expire = token_info[:expires_in]
    judge_validate_user(token_info[:access_token])
  end

  def get_facebook_user
    # fieldsを指定することによって、取得したい情報を指定できる
    profile_hash = @koala.get_object('me', fields: REQUEST_USER_FIELDS)
    # 上記で取得したFB情報を、Accountに格納する
    # すでに、accountがある場合は、そのレコードを更新する
    account = Account.find_or_initialize_by(graph_id: profile_hash['id'])
    account.name = profile_hash['name']
    account.first_name = profile_hash['first_name']
    account.last_name = profile_hash['last_name']
    account.gender = profile_hash['gender']
    account.locale = profile_hash['locale']
    account.timezone = profile_hash['timezone']
    account.profile_page_url = profile_hash['link']
    account.profile_picture_url = profile_hash['picture']['data']['url']
    account.age_range_min = profile_hash['age_range']['min']
    account.access_token = @access_token
    account.token_expire = culc_expire_date
    account
  end

  private

  def judge_validate_user(access_token)
    validate_token_info = @koala.debug_token(access_token)
    # 基本的に、不正なユーザー以外はFBログイン落ちないので
    # 処理を落とすだけでおっけい
    fail unless validate_token_info['data']['is_valid']
    fail unless validate_token_info['data']['app_id'] == ENV['FACEBOOK_CLIENT_ID']
    fail unless validate_token_info['data']
  end

  def culc_expire_date
    # tokenの有効期限が切れた場合は、再びログインさせる必要がある
    # ここでは、有効期限が切れる一日前を計算して、token_expireに
    # 格納する
    # TODO:
    # 後日tokenを再発行する処理を実装
    Time.current.since(@expire) - 1.days
  end
end
