class EngineersController < ApplicationController
  # ログイン要求処理(ログインしていないと見られたくないページに設定)
  before_action :require_user_logged_in, only: [:show]

  def index
    @engineers = Engineer.all.page(params[:page])
  end

  def show
    @engineer = Engineer.find(params[:id])
    @user = current_user
  end

  def new
    @engineer = Engineer.new
  end

  def create
    @engineer = Engineer.new(engineer_params)

    # ログインユーザのIDをセット
    @engineer.user_id = current_user.id

    if @engineer.save
      flash[:success] = 'エンジニアプロフィールを登録しました。'
      redirect_to @engineer
    else
      flash.now[:danger] = 'エンジニアプロフィールの登録に失敗しました。'
      render :new
    end
  end

  private

  def engineer_params
    params.require(:engineer).permit(:profile)
  end

end
