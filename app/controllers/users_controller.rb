class UsersController < ApplicationController

  def index
    @kisei = Adkisei.find(params[:kisei_id])
    @users = @kisei.adusers
  end

end
