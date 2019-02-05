Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}

  devise_scope :user do
    delete :sign_out, to: 'devise/sessions#destroy'
  end

  root to: 'items#index'

  resources :users do
    collection do
      get '/:id/identify', to: 'users#identify'
      get '/:id/logout', to: 'users#logout'
      get '/:id/sales', to: 'users#sales'
      get '/:id/trade/sell', to: "items#trade_sell"
      get '/:id/trade/now', to: "items#trade_now"
      get '/:id/trade/sold', to: "items#trade_sold"
      get '/:id/buy/now', to: "items#buy_now"
      get '/:id/bought', to: "items#bought"
      get '/:id/registrate', to: "cards#registrate"
    end
    resources :reviews, only: [:new, :create]
    resources :cards, only:[:index,:new, :pay]
      collection do
        post '/pay', to: "cards#pay"
      end
  end

  resources :items do
    resources :reviews, only: [:new, :create]
    collection do
      get '/:id/buy', to: 'items#buy'
      get '/:id/buy_confirm', to: 'cards#buy_confirm'
      post '/:id/buy', to: 'cards#buy'
      get '/:id/change', to: 'items#change'
      delete '/:id/change', to: 'items#destroy'
      delete '/trade/now', to: "items#trade_now"
      get '/search', to: 'items#search'
      post '/search', to: 'items#search'
    end
  end

  resources :item_images, only:[:destroy]

  patch '/:id/user/identify', to: 'users#identify'

end
