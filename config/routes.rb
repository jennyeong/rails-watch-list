Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get 'lists', to: 'lists#index'
  # get "lists/new", to: 'lists#new'
  # get 'lists/:id', to: 'lists#show', as: :list
  # post "lists", to: 'lists#create'

  root 'lists#index'
  resources :lists, only: %i[index new show create] do
    resources :bookmarks, only: %i[new create]
  end

  resources :bookmarks, only: [:destroy]
end
