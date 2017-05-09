Rails.application.routes.draw do
  root 'map#index'
#  get  '/cemeteries.json', to: 'cemeteries#show'
  get  '/cemeteries/cemetery_data', :defaults => { :format => 'json' }
  get  '/cemeteries/plots_data', :defaults => { :format => 'json' }
  get  '/cemeteries/list', to: 'cemeteries#list'
  get  '/home',       to: 'static_pages#home'
  get  '/help',       to: 'static_pages#help'
  get  '/about',      to: 'static_pages#about'
  get  '/contact',    to: 'static_pages#contact'
  get  '/signup',     to: 'users#new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  resources :cemeteries, only: [:index, :show]
  resources :users
  resources :password_resets, only: [:new, :create, :edit, :update]
  match '*path', via: [:options], to:  lambda {|_| [204, {'Access-Control-Allow-Headers' => "Origin, Content-Type, Accept, Authorization, Token", 'Access-Control-Allow-Origin' => "*", 'Content-Type' => 'text/plain'}, []]}
end
