class Admin::AddashboardController < Admin::ApplicationController

  before_action :auth_user

  def index
    @adkiseis = Adkisei.all
    @adusers = Aduser.all
    @adcontacts = Contact.all
  end
end
