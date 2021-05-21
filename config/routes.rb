Rails.application.routes.draw do
  resources :posts do
  end
  get '/', to: 'posts#index'
end
