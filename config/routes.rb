require 'sidekiq/web'

Rails.application.routes.draw do

  mount Sidekiq::Web, at: '/sidekiq'
  devise_for :users

  root 'welcome#home'

  resources :accounts do
    resources :products do
      delete :color
      delete :size
      post :assign_colors
      post :assign_sizes
    end
    get :order_form
    resources :orders do
      get :shipping_details
      post :shipping_details_save
      resources :order_items
    end

  end

  resources :carts do
  end


  resources :colors

  resources :sizes

end
