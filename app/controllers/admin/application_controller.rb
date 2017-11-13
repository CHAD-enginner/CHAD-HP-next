class Admin::ApplicationController < ActionController::Base

   before_action :authenticate_adminuser!

  def after_sign_in_path_for(resource)
    # deviseでログインした後に、FBログインをさせる
    admin_root_path
  end

  def auth_user
    if cookies[:chad_account_id].blank?
      # ここで、FBログインの処理を書いていく！
      # redirect_urlにauth_controllerのcallbackアクションが設定されているので
      # redirect_toで返す
      return redirect_to FacebookAuthService.new.auth_uri
    end
    # アカウント情報をインスタンス変数に格納して返す
    @account = Account.find(cookies['chad_account_id'])
    FacebookAuthService.new.auth_uri if @account.check_token_expired?
  end
end
