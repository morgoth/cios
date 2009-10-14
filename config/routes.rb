ActionController::Routing::Routes.draw do |map|
  map.resources :sponsors, :collection => { :sort => :post }, :except => [:new]

  map.resources :posts
  map.resources :comments, :except => [:show, :index, :new]
  map.resource :user_session, :only => [:new, :create, :destroy]
  map.resources :users
  map.resource :account, :controller => "users"
  map.resources :boxers

  map.gallery '/gallery', :controller => 'galleries', :action => 'albums'
  map.login '/login', :controller => 'user_sessions', :action =>'new'
  map.contact 'contact', :controller => 'static', :action => 'contact'
  map.trainings 'trainings', :controller => 'static', :action => 'trainings'
  map.bank_account 'bank_account', :controller => 'static', :action => 'bank_account'
  map.root :controller => 'Posts'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
