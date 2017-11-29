class EventLog < ApplicationRecord
  # event_typeは、必要になったら順次付け加えていく
  enum event_type: { login: 0, user_clicked: 1 }

  belongs_to :account
  belongs_to :aduser, optional: true

  class << self
    def limit_top_five
    end
  end
end
