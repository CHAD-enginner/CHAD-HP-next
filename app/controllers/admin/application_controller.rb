class Admin::ApplicationController < ActionController::Base

   before_action :authenticate_adminuser!

  def after_sign_in_path_for(resource)
    admin_root_path
  end


end
