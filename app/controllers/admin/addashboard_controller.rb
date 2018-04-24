class Admin::AddashboardController < Admin::ApplicationController

  # Fbログイン修正が完成するまで、コメントアウト
  # before_action :auth_user

  before_action :auth_line_user

  def index
    NotifySlackService.new(@account).save_login_log
    @adkiseis = Adkisei.all
    @adusers = Aduser.all
    @adcontacts = Contact.all
  end
end
