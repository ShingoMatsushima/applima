class Engineer < ApplicationRecord

  # バリデーション
  validates :user_id, presence: true

  # "1対1"表現
  belongs_to :user
  has_many :project_rooms

end
