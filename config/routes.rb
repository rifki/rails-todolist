Rails.application.routes.draw do
  resources :todos
  
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  get '/todos/ascompleted/:id', to: 'todos#ascompleted', as: 'ascompleted'
  root 'todos#index'
  get '/hello', to: 'todos#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
