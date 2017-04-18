class Admin::AdkiseisController < Admin::ApplicationController

  before_action :set_adminuser, only: [:new, :destroy, :edit]


  def index
    @adkiseis = Adkisei.all
  end

  def new
    if @adminuser.id != 2
      redirect_to admin_root_path
    else
      @adkisei = Adkisei.new
    end
  end

  def create
    @adkisei = Adkisei.new(adkisei_params)
    if @adkisei.save
      redirect_to admin_kiseis_path
    else
    end

  end

  def destroy
    if @adminuser.id != 2
      redirect_to admin_root_path
    else
      @adkisei = Adkisei.find(params[:id])
      if @adkisei.destroy
        redirect_to admin_kiseis_path
      else
      end
    end
  end

  def edit
    if @adminuser.id != 2
      redirect_to admin_root_path
    else
      @adkisei = Adkisei.find(params[:id])
    end
  end

  def update
    @adkisei = Adkisei.find(params[:id])
    if @adkisei.update(adkisei_params)
      redirect_to admin_adkisei_path(@adkisei.id)
    else

    end
  end

  def show
    @adkisei = Adkisei.find(params[:id])
  end

  private

  def adkisei_params
    params.require(:adkisei).permit(:name, :text, :backimage)
  end

  def set_adminuser
    @adminuser = Adminuser.find(current_adminuser.id)
  end


end
