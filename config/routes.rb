ActionController::Routing::Routes.draw do |map|
	map.resources :posts
	map.resources :comments, :except => [:show, :index, :new]
	map.resource :user_session
	map.resources :users
	map.resource :account, :controller => "users"
	
	map.gallery '/gallery', :controller => 'galleries', :action => 'albums'

	map.root :controller => 'Posts'
	
	map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
