class ContactsController < ApplicationController

  layout "devise"

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
      if @contact.save
        MailSenderMailer.inquiry(@contact).deliver_now #rails g mailer mail_sender inquiry, mail_senderはクラス名, inquiryはインスタンス名、これをして@contactを送る！
      else
        render :new
      end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :text, :university, :grade)
  end
end
