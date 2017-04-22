class Admin::AdusersController < Admin::ApplicationController

  before_action :set_adminuser, only: [:new, :edit, :destroy]

  def index
    @adusers = Aduser.order(adkisei_id: :asc)
    @adkiseis = Adkisei.all
  end

  def new
    if @adminuser.id != 2
      redirect_to admin_root_path
    else
      @aduser = Aduser.new
      @adkiseis = Adkisei.all
    end
  end

  def search
    @adkiseis = Adkisei.all
    @adkisei_param = params[:aduser][:adkisei_id]
    @name_param = params[:aduser][:name]

    if @adkisei_param.nil? && @name_param.nil?
      redirect_to admin_root_path
    elsif @adkisei_param.present? && @name_param.present?
      @adusers = Aduser.where("adkisei_id = ? AND name LIKE?", params[:aduser][:adkisei_id], "%#{params[:aduser][:name]}%")
      return @adusers
    elsif @name_param.present?
      @adusers = Aduser.where('name LIKE?', "%#{params[:aduser][:name]}%")
      return @adusers
    elsif @adkisei_param.present?
      @adusers = Aduser.where("adkisei_id = ?", params[:aduser][:adkisei_id])
      return @adusers
    end
  end

  def create
    @aduser = Aduser.new(aduser_params)
    if @aduser.save
      redirect_to  admin_adusers_path
    else
    end
  end

  def edit
    if @adminuser.id != 2
      redirect_to admin_root_path
    else
      @aduser = Aduser.find(params[:id])
      @adkiseis = Adkisei.all
    end
  end

  def update
    @aduser = Aduser.find(params[:id])
    if @aduser.update(aduser_params)
      redirect_to admin_aduser_path(@aduser.id)
    else
    end
  end

  def show
    @aduser = Aduser.find(params[:id])
  end

  def destroy
    if @adminuser.id != 2
      redirect_to admin_root_path
    else
      @aduser = Aduser.find(params[:id])
      if @aduser.destroy
        redirect_to admin_adusers_path
      else
      end
    end
  end


  private

  def aduser_params
    params.require(:aduser).permit(:adkisei_id, :name, :role, :email, :adress, :phone, :avator, :university, :studentnumber)
  end

  def set_adminuser
    @adminuser = Adminuser.find(current_adminuser.id)
  end

end
