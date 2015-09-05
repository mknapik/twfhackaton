Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'main#index'

  get '/tiles' => 'tiles#show'
  get '/tile/new' => 'tiles#new'
  post '/tile/create' => 'tiles#create'

end
