class NotifySlackService

    attr_accessor :account

    def initialize(account)
      @account = account
    end

  def save_login_log
     notify_slack
     account.event_logs.create(event_type: 'login')
  end

  private

  def notify_slack
    text = "#{account.name}さんがアクセスしました。"
    Slack.chat_postMessage text: text, username: "ぴょんちゃん", channel: "#general"
  end
end