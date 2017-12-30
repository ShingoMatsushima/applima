class ProjectRoom < ApplicationRecord
  # statusのenum定義(0:終了(default), 1:募集中)
  enum status:{ close:0, open:1 }

  # バリデーション
  validates :idea_id, presence: true
  validates :engineer_id, presence: true
  
  # "1対多"表現
  belongs_to :idea
  belongs_to :engineer
  has_many :project_comments

end
