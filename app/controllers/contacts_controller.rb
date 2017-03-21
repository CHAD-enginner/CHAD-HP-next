class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
      if @contact.save
        MailSenderMailer.inquiry(@contact).deliver #rails g mailer mail_sender inquiry, mail_senderはクラス名, inquiryはインスタンス名、これをして@contactを送る！
        respond_to do |format|
          format.json{
            render json: @contact #json形式で送られてきたので、きちんとrender json:@contactをしてあげて、返してあげないとActionController::UnknownFormatのエラーになって、きちんと送信できなくなる。
          }
        end
      else
        render :news
      end
  end




  private
  def contact_params
    params.permit(:name, :email, :text, :university, :grade)
  end
end


