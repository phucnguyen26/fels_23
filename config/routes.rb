Rails.application.routes.draw do
    root "static_pages#home"
    get 'home'     => 'static_pages#home'
    get 'signup'   => 'users#new'
    get 'login'    => 'sessions#new'
    post 'login'   => 'sessions#create'
    delete'logout' => 'sessions#destroy'
    resources :users
    resources :account_activations, only: [:edit]
    resources :relationships,       only: [:create, :destroy]
    resources :lessons do
        resources :results
    end
    resources :words
    resources :categories do
        resources "words", only: [:index]
    end
end