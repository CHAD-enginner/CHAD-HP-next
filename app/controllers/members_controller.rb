class MembersController < ApplicationController

  def index
    @first = Kisei.find(1)
    @second = Kisei.find(2)
    @third = Kisei.find(3)
  end

end

