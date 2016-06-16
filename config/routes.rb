Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    unlocks: 'users/unlocks',
    # omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: 'bands#index'

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :festivals do
    resources :bands
  end
end
