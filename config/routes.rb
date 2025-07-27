Rails.application.routes.draw do
  resources :games, only: [:index, :create, :show] do
    resources :scores, only: [:index, :create, :update, :destroy]
  end

  # プレイヤー一覧
  resources :players, only: [:index, :create, :update, :destroy]

  # スコア履歴用の API エンドポイント
  get '/games_with_scores', to: 'games#with_scores'
end
