class Admin::AdcontactsController < Admin::ApplicationController

  # before_action :auth_user

  def index
    @contacts = Contact.all
  end

end
