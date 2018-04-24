class Admin::LineLoginsController < ApplicationController

  before_action :auth_line_user

  def login
    redirect_to admin_addashboard_index_path
  end

  private

  def auth_line_user
    if cookies[:chad_account_id].blank?
       return redirect_to LineAuthService.new.auth_uri
    end
    @account = Account.find_by(hash_id: cookies[:chad_account_id])
    redirect_to LineAuthService.new.auth_uri if @account.check_token_expired?
  end
end
