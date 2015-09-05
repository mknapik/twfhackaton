Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'main#index'

  scope :api do
    resources :games, only: [:index, :show] do
      get :preview
      post :solution
    end
  end

  scope :admin do
    resources :tiles, only: [:index, :new, :create]
  end
end
