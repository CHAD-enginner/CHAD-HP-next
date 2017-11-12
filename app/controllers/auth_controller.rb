class AuthController < Admin::ApplicationController

  def callback
    token_info = FacebookAuthService.new.fetch_toke_info(params[:code])
    return render '/404.html' if token_info.blank?
    account = FacebookGraphService.new(token_info).get_facebook_user
    account.save ? redirect_page_internal(account) : redirect_top_page
  end

  private

  def redirect_page_internal(account)
    cookies['chad_account_id'] = account.id
    redirect_to admin_root_path
  end

  def redirect_top_page
    # TODO:
    # エラー内容を表示させる実装する
    render '/404.html'
  end
end
