Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'categories#index'
  resources :categories, :only => [:new, :create, :destroy]
  resources :articles, :only => [:new, :create, :destroy]
  resources :article_categories, :only => [:new]
end
