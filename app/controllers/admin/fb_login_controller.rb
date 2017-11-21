class Admin::FbLoginController < Admin::ApplicationController
  before_action :auth_user

  def index
    # 最近ログインしてたら、trueを返す
    save_login_info unless @account.currently_logined?
    # すでに、cookiesが存在する場合、ダッシューボードページに遷移する
    redirect_to admin_addashboard_index_path
  end

  private

  # ユーザーのログイン情報を保存するメソッド
  def save_login_info
    notify_to_slack
    @account.event_logs.create(event_type: 'login')
  end

  def notify_to_slack
    text = "#{@account.name}さんがアクセスしました。"
    Slack.chat_postMessage text: text, username: "ぴょんちゃん", channel: "#general"
  end
end
