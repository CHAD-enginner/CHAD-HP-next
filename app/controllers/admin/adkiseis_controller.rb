class Admin::AdkiseisController < Admin::ApplicationController

  def index
    @adkiseis = Adkisei.all
  end

  def new
    @adkisei = Adkisei.new
  end

  def create
    @adkisei = Adkisei.new(adkisei_params)
    if @adkisei.save
      redirect_to admin_kiseis_path
    else
    end

  end

  def destroy
    @adkisei = Adkisei.find(params[:id])
    if @adkisei.destroy
      redirect_to admin_kiseis_path
    else
    end

  end

  def edit
    @adkisei = Adkisei.find(params[:id])
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


end
