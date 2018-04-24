class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def line
    # lineログイン後の処理を書いていく
    account = LineAuthService.new.get_line_profile(request)
    cookies[:chad_account_id] = account.hash_id
    redirect_to admin_root_path
  end
end
