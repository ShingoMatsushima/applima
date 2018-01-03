module EngineersHelper

  # エンジニアプロフィール登録チェック
  def write_profile?
    !!current_user.engineer
  end

end
