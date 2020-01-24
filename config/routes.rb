Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  #   root to: 'products#index'
  # resources :products do
  #   resources :reviews
  end
# end


#
# Rails.application.routes.draw do
#   get 'pages/home'
#   devise_for :users
#     root to: 'products#index'
#   resources :products do
#     resources :reviews
#   end
# end
