class ProjectComment < ApplicationRecord
  # バリデーション
  validates :project_room_id, presence: true

  # "1対多"表現
  belongs_to :project_room

end
