class Admin::AdusersController < Admin::ApplicationController

  def index
    @adusers = Aduser.all
  end

  def new
    @aduser = Aduser.new
    @adkiseis = Adkisei.all
  end

  def create
    @aduser = Aduser.new(aduser_params)
    if @aduser.save
      redirect_to  admin_adusers_path
    else
    end
  end

  def edit
    @aduser = Aduser.find(params[:id])
    @adkiseis = Adkisei.all
  end

  def update
    @aduser = Aduser.find(params[:id])
    if @aduser.update(aduser_params)
      redirect_to admin_adusers_path
    else
    end
  end

  def show
    @aduser = Aduser.find(params[:id])
  end

  def destroy
    @aduser = Aduser.find(params[:id])
    if @aduser.destroy
      redirect_to admin_adusers_path
    else
    end
  end


  private

  def aduser_params
    params.require(:aduser).permit(:adkisei_id, :name, :role, :email, :adress, :phone, :avator)
  end

end
