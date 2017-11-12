class Admin::AddashboardController < Admin::ApplicationController

  before_action :notify_to_slack, :auth_user

  def index
    @adkiseis = Adkisei.all
    @adusers = Aduser.all
    @adcontacts = Contact.all
  end


  def notify_to_slack
    text = "メンバーがアクセスしました。"
    Slack.chat_postMessage text: text, username: "ぴょんちゃん", channel: "#general"
  end
end
