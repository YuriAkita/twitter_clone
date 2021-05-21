Rails.application.routes.draw do
  resources :posts
  get '/', to: 'posts#index'
end
