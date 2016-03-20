Rails.application.routes.draw do
  get "/" => 'products#index'

  get "/products" => 'products#index'
  get "/products/new" => 'products#new'
  post "/products" => 'products#create'
  get "/products/:id/edit" => 'products#edit'
  delete "/products/:id" => 'products#destroy'
  patch "/products/:id" => 'products#update'
  get "/products/:id" => 'products#show'

  get "/suppliers" => 'suppliers#index'
  get "/suppliers/new" => 'suppliers#new'
  post "/suppliers" => 'suppliers#create'
  get "/suppliers/:id/edit" => 'suppliers#edit'
  delete "/suppliers/:id" => 'suppliers#destroy'
  patch "/suppliers/:id" => 'suppliers#update'
  get "/suppliers/:id" => 'suppliers#show'

  post "/search" => 'products#run_search'
end
