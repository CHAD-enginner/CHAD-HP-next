class UsersController < ApplicationController

  def index
    @kisei = Kisei.find(params[:kisei_id])
    @users = @kisei.users
  end

end
