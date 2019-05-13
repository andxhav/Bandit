Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :band_members

  resources :musicians, only: [:index, :new, :create, :show, :update]

  resources :bands, only: [:index, :show, :new, :create] do
    resources :musicians, only: [:new, :create, :show]
    resources :band_members, only: [:new, :create]
  end

  namespace :api do
    namespace :v1 do
      resources :bands, only: [:show]
      resources :musicians, only: [:show, :create, :update]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
