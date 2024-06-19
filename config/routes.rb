Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles do
    collection do
      get 'category/:category_id', to: 'articles#category', as: :category
    end
  end

  get 'dashboard', to: 'pages#dashboard'
end
