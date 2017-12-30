class Idea < ApplicationRecord
  # statusのenum定義(0:終了(default), 1:募集中)
  enum status:{ close:0, open:1 }

  # バリデーション
  validates :name, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true

  # "1対多"表現
  belongs_to :user
  has_many :idea_comments
  has_many :project_rooms

end
