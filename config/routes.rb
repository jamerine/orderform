Rails.application.routes.draw do

  devise_for :users

  root 'welcome#home'

  resources :accounts do
    resources :products
  end

end
