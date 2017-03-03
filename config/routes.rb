Rails.application.routes.draw do

  devise_for :users

  root 'welcome#home'

  resources :accounts do
    resources :products do
      delete :color
      post :assign_colors
    end
  end

  resources :colors

end
