class Admin::AdcontactsController < Admin::ApplicationController

  def index
    @contacts = Contact.all
  end

end
