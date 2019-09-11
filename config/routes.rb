Rails.application.routes.draw do


	root 'top#home'

	get '/top/about' => 'top#about'



	devise_for :users
  resources :books,only:[:new,:create,:index,:show,:destroy, :edit, :update]
  resources :users,only:[:index,:show,:update,:edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
