class User < ApplicationRecord
  # regtypeのenum定義(0:アイデアマン(default), 1:エンジニア, 2:両方)
  enum regtype:{ ideaman:0, engineer:1, both:2 }

  # バリデーション
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  # passwordのセキュリティ設定
  has_secure_password

  # "1対多"表現
  has_many :ideas

  # "1対1"表現
  has_one :engineer

end
