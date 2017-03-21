class MailSenderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_sender_mailer.inquiry.subject
  #
  def inquiry(contact) #contacts_controllerで書いたmailのクラス、インスタンスはここで定義されていいる！
    @contact = contact #contacts_controllerで送った@contactをもう一回@contactに格納して、inquiry.html.hamlで内容を取り出せるようにしている！

    mail to: "mhtnim1023@gmail.com"
  end
end
