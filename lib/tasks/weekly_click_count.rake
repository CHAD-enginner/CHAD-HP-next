namespace :weekly_click_count do
  desc '週次でのアカウント、ユーザーのクリックイベントの集計を行う'
  # モデルにアクセスする場合は、environmentが必要
  task login: :environment do
    ClickCounter::WeeklyLogin.excute(Time.zone.now)
  end
end
