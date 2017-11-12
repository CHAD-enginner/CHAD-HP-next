class Admin::ApplicationController < ActionController::Base

   before_action :authenticate_adminuser!

  def after_sign_in_path_for(resource)
    admin_root_path
  end

  def auth_user
    if cookies[:account_id].blank?
    # ここで、FBログインの処理を書いていく！
    end
    # アカウント情報をインスタンス変数に格納して返す
  end
end
