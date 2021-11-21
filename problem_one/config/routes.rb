Rails.application.routes.draw do
  get 'practicing_states/index'
  get 'advocates/index'
  get 'advocates/assitants'
  get 'cases/index'
  get 'dashboard/index'
  devise_for :advocates
  devise_scope :advocate do
    get '/advocates/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'dashboard#index'

  resources :cases do
  	collection do
  		post 'take_case'
  		post 'reject_case'
  		post 'close_case'
  	end
  end

  resources :practicing_states
  resources :advocates do
  	collection do
  		post 'make_assitant'
  		post 'remove_assitant'
  		post 'add_assitant'
  		get 'new_assitant'
  		get 'assitants'
  	end
  end
end
