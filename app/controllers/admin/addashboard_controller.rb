class Admin::AddashboardController < Admin::ApplicationController

  # Fbログイン修正が完成するまで、コメントアウト
  # before_action :auth_user

  def index
    @adkiseis = Adkisei.all
    @adusers = Aduser.all
    @adcontacts = Contact.all
  end
end
