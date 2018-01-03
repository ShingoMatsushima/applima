module UsersHelper

  # 登録種別チェック(enum値で返す)
  def reg_type?
    current_user.regtype
  end

  # エンジニアチェック
  def engineer?
    reg_type? == "engineer"
  end

  # アイデアマンチェック
  def ideaman?
    reg_type? == "ideaman"
  end

  # gravatorアイコン取得
  def gravatar_url(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  end

end
