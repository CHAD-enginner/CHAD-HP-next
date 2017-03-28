class Admin::AddashboardController < Admin::ApplicationController

  def index
    @adkiseis = Adkisei.all
    @adusers = Aduser.all
    @adcontacts = Contact.all
  end

end
