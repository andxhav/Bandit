Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :musicians, only: [:index, :new, :create, :show]

  resources :bands, only: [:index, :show, :new, :create] do
    resources :musicians, only: [:new, :create, :show]
  end

  namespace :api do
    namespace :v1 do
      resources :bands, only: [:show]
      resources :musicians, only: [:show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
