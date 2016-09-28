Rails.application.routes.draw do
    get 'users/regist'
    resources :users
    
    resources :sessions
    get   'login'   => 'sessions#new'
    post  'login'   => 'sessions#create'
    get   'logout'  => 'sessions#destroy'
    get   'password_change' => 'sessions#password'
    post  'password_change' => 'sessions#password_change'
    get   'sessions/new'
    
    root 'sessions#new'
  resources :rooms do
	  resources :bookings do
    collection do
      get 'history'
      end
    end
    end

	root :to => "rooms#index"
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
