class Admin::AdusersController < Admin::ApplicationController

  before_action :set_adminuser, only: [:new, :edit, :destroy]
  # before_action :auth_user

  def index
    @adkiseis = Adkisei.all
    @adusers = Aduser.order(adkisei_id: :asc)
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
    # FIXME: FBログインが修正できるまでログを残さないように編集
    # @aduser.event_logs.create(event_type: 'user_clicked', account_id: @account.id)
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

  def notify_to_slack
    text = "#{@account.name}（id=#{@account.id}）さんが#{params[:name].gsub(" ", "")}さんのプロフィールを閲覧しました。"
    Slack.chat_postMessage text: text, username: "ログさん", channel: "#chat-member-log"
  end


  private

  def aduser_params
    params.require(:aduser).permit(:adkisei_id, :name, :role, :email, :adress, :phone, :avator, :university, :studentnumber)
  end

  def set_adminuser
    @adminuser = Adminuser.find(current_adminuser.id)
  end

end
