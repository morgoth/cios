Cios::Application.routes.draw do
  resources :partners, :except => [:new] do
    member do
      put :up
      put :down
    end
  end

  resources :posts do
    resources :comments, :except => [:show, :index, :new] do
      put :mark_as_spam, :on => :member
    end
  end

  resources :galleries, :only => [:index, :show]
  resource :user_session, :only => [:new, :create, :destroy]
  resources :users
  resource :account, :controller => "users"
  resources :people, :only => [:index]
  resources :boxers
  resources :coaches
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
