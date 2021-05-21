Rails.application.routes.draw do
  resources :posts do
  get '/', to: 'posts#index'
end
