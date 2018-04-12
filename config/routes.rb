Rails.application.routes.draw do
  
  devise_for :users
  root 'questions#index'
  post "/voteup", to: "votes#voteup"
	post "/votedown", to: "votes#votedown"
  resources :questions
  resources :answers, only: [:create, :destroy]
  resources :comments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
