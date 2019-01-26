Rails.application.routes.draw do
  devise_for :users

  # controllers: {
  #   confirmations: 'users/confirmations',
  #   passwords:     'users/passwords',
  #   registrations: 'users/registrations',
  #   sessions:      'users/sessions',
  # }

  # devise_scope :user do
  #   get 'sign_in', to: 'users/sessions#new'
  #   get 'sign_out', to: 'users/sessions#destroy'
  #   get 'sign_up', to: 'users/registrations#new'
  # end

  root to: 'items#index'

  resources :users, only: [:show, :edit, :update, :destroy] do
    collection do
      get ':id/identify', to: 'users#identify'
      get ':id/pay_way', to: 'users#pay_way'
      get ':idd/add_card', to: 'users#add_card'
      get ':id/logout', to: 'users#logout'
    end
  end

  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
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
end

