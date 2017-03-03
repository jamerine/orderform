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
  end

  resources :colors

  resources :sizes

end
