module ClickCounter
  class WeeklyLogin
    class << self
      def excute(date)
        # ここから、一週間のデータを取得するロジックを書いて行く
        login_event_logs = EventLog.where(created_at: get_week_range(date), event_type: 'login')
        # TODO: 
        # 上限5位を取得！
        group_each_account_log(login_event_logs)
      end

      private

      def get_week_range(date)
        beginning_week = (date - 1.week).beginning_of_day
        end_week = date.end_of_day
        week_range = beginning_week..end_week
      end

      def group_each_account_log(login_event_logs)
        grouped_log_hash = login_event_logs.group_by { |log| log.account_id }
        grouped_log_hash.each do |account_id, log|
          login_count = log.count
          account_id = account_id
          WeeklyLoginCount.create(number_of_times: login_count, account_id: account_id)
        end
      end
    end
  end
end
