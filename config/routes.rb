Rails.application.routes.draw do

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
      resources :order_items
    end

  end

  resources :orders

  resources :cart


  resources :colors

  resources :sizes

end
