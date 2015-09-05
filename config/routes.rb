Rails.application.routes.draw do
  root               'static_pages#home'
  get    'add_book'    => 'products#new'
  get    'signup'      => 'users#new'
  get    'login'       => 'sessions#new'
  post   'login'       => 'sessions#create'
  delete 'logout'      => 'sessions#destroy'
  resources :users
  resources :products
end
