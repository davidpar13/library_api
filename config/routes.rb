Rails.application.routes.draw do
  resources :fees
  resources :rental_transactions
  resources :memberships
  resources :books
  resources :libraries
  resources :members

  get 'book_search', to: 'books#book_search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
