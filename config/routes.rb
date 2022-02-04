Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users

  patch '/users/update/:id', to: 'users#update', as: 'branch_update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
