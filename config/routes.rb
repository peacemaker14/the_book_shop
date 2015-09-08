Rails.application.routes.draw do
  get 'orders/new'

  get 'carts/show'

  root               'static_pages#home'
  get    'add_book'    => 'products#new'
  get    'signup'      => 'users#new'
  get    'login'       => 'sessions#new'
  get    'new_order'   => 'orders#new'
  post   'login'       => 'sessions#create'
  delete 'logout'      => 'sessions#destroy'
  resources :users
  resources :products
  resources :line_items
  resources :carts
  resources :orders
end
