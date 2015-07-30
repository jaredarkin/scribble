Rails.application.routes.draw do

  root to: 'posts#index'

  resources :posts, :users do
    resources :comments
  end

end
