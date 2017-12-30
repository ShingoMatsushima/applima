class IdeaComment < ApplicationRecord

  # comment_typeのenum定義(0:ユーザー入力コメント(default), 1:システム自動付与コメント)
  enum comment_type:{ nomal:0, auto:1 }

  # バリデーション
  validates :idea_id, presence: true

  # "1対多"表現
  belongs_to :idea

end
