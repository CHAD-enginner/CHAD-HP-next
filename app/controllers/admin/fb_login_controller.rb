class Admin::FbLoginController < Admin::ApplicationController
  before_action :auth_user

  def index
    notify_to_slack
    # すでに、cookiesが存在する場合、ダッシューボードページに遷移する
    redirect_to admin_addashboard_index_path
  end

  def notify_to_slack
    text = "#{@account.name}さんがアクセスしました。"
    Slack.chat_postMessage text: text, username: "ぴょんちゃん", channel: "#general"
  end
end
