Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    delete :sign_out, to: 'devise/sessions#destroy'
  end

  root to: 'items#index'

  resources :users, only: [:show, :edit, :update, :destroy] do
    collection do
      get '/:id/identify', to: 'users#identify'
      get '/:id/logout', to: 'users#logout'
      get '/:id/trade/sell', to: "items#trade_sell"
      get '/:id/trade/now', to: "items#trade_now"
      get '/:id/trade/sold', to: "items#trade_sold"
      get '/:id/buy/now', to: "items#buy_now"
      get '/:id/bought', to: "items#bought"
    end
  end

  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get '/:id/buy', to: 'items#buy'
      get '/:id/buy_confirm', to: 'cards#buy_confirm'
      post '/:id/buy', to: 'cards#buy'

    end
  end
  resources :users, only:[:show] do
    resources :cards, only:[:index,:new, :pay]
      collection do
        post '/pay', to: "cards#pay"
      end
  end
  get '/user/adress/registrate', to: 'users#new'
  get '/user/adress/registrate/create', to: 'users#create'
end

