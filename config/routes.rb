Cios::Application.routes.draw do
  filter :locale

  resource :session, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :partners, :except => [:new] do
    put :up, :on => :member
    put :down, :on => :member
  end

  resources :posts do
    resources :comments, :except => [:show, :index, :new] do
      put :mark_as_spam, :on => :member
    end
  end

  resources :galleries, :only => [:index, :show]
  resources :users
  resource :account, :controller => "users"
  resources :people, :only => [:index]
  resources :boxers
  resources :coaches
  resources :spam_reports do
    post :update_multiple, :on => :collection
  end

  get "contact", :to => "static#contact"
  get "trainings", :to => "static#trainings"
  get "bank_account", :to => "static#bank_account"

  root :to => "posts#index"
end
