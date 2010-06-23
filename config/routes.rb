Cios::Application.routes.draw do
  resources :sponsors, :except => [:new] do
    post :sort, :on => :collection
  end

  resources :posts
  resources :galleries, :only => [:index, :show]
  resources :comments, :except => [:show, :index, :new]
  resource :user_session, :only => [:new, :create, :destroy]
  resources :users
  resource :account, :controller => "users"
  resources :boxers
  resources :defensio_reports do
    post :update_multiple, :on => :collection
  end

  match "login", :to => "user_sessions#new"
  match "logout", :to => "user_sessions#destroy"

  match "contact", :to => "static#contact"
  match "trainings", :to => "static#trainings"
  match "bank_account", :to => "static#bank_account"

  root :to => "posts#index"
end
