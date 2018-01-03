Rails.application.routes.draw do
  # TOPページ
  root to: 'toppages#index'

  # ログイン(一旦、変更・削除はなし)
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
  
  # セッション管理
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # エンジニア専用ページ(一旦、変更・削除はなし)
  resources :engineers, only: [:index, :show, :new, :create]

  # アイデア(一旦、変更・削除はなし)
  resources :ideas, only: [:index, :show, :new, :create]

end
