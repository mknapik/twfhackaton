Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'main#index'

  get '/tiles' => 'tiles#show'
  get '/tile/new' => 'tiles#new'
  post '/tile/create' => 'tiles#create'

  scope :api do
    resources :games, only: [:index, :show] do
      get :preview
    end
  end
end
