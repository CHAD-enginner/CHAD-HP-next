class Admin::AdcontactsController < Admin::ApplicationController

  require 'jwt'

  METABASE_SITE_URL = "http://serene-badlands-13533.herokuapp.com"
  METABASE_SECRET_KEY = ENV['METABASE_SECRET']

  before_action :auth_line_user

  def index
    payload = {
      :resource => {:dashboard => 4},
      :params => {
        
      }
    }
    token = JWT.encode payload, METABASE_SECRET_KEY
    @iframe_url = METABASE_SITE_URL + "/embed/dashboard/" + token + "#bordered=true&titled=true"
    @contacts = Contact.all
  end

end
