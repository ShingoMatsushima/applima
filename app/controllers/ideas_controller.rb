class IdeasController < ApplicationController
  # ログイン要求処理(ログインしていないと見られたくないページに設定)
  before_action :require_user_logged_in

  def index
    @ideas = Idea.all.page(params[:page])
  end

  def show
    @idea = Idea.find(params[:id])
    @user = current_user
  end

  def new
    @idea = Idea.new
  end

  def create
    # 入力フォームのデータをセット
    @idea = Idea.new(idea_params)
    # ログインユーザのIDをセット
    @idea.user_id = current_user.id
    # ステイタスを"募集中"に変更
    @idea.status = "open"

    if @idea.save
      flash[:success] = 'アイデアを投稿しました。'
      redirect_to @idea
    else
      flash.now[:danger] = 'アイデアの投稿に失敗しました。'
      render :new
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :about)
  end
end
