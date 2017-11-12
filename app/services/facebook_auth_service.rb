# 基本的に、facebookのaccesss_tokenを取得するためのserviceクラス
# accesss_tokenは、ログインした人の情報を取得する際に必要になる
class FacebookAuthService
  REQUEST_PERMISSIONS = %w[
    public_profile
  ].freeze

  def initialize
    @koala = Koala::Facebook::OAuth.new(
    # facebookに登録したapp_id
    ENV['FACEBOOK_CLIENT_ID'],
    # facebookに登録したapp_secret_id
    ENV['FACEBOOK_CLIENT_SECRET'],
    # responseが帰って来た時に、redirectするurlを設定
    callback_url
    )
  end

  def auth_uri
    # permissionを付与した、codeを取得する
    @koala.url_for_oauth_code(permissions: REQUEST_PERMISSIONS)
  end

  def fetch_toke_info(code)
    # access_tokenを取得する（シンボルで）
    @koala.get_access_token_info(code).symbolize_keys
  rescue Koala::Facebook::OAuthTokenRequestError => e
    # 再びFBログインさせる処理に戻す実装
  end

  private

  def callback_url
    routes = Rails.application.routes.url_helpers
    # 上記で、urlを取得するmoduleを作成できる
    routes.url_for(controller: 'auth', action: 'callback')
    # 上記で、http://からのurlを作成できる
  end
end
