Rails.application.routes.draw do

  root 'users#show'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' =>'sessions#destroy'
  get 'feedback' => 'comments#index'
  get 'dashboard' => 'users#dashboard'
  get 'edit_user_comment' => 'comments#edit'
  get 'assign' => 'bids#assign'
  resources :bids
  resources :projects
  resources :assignments, only: [:index, :new, :create]
  resources :users, except: [:new] do
    resources :comments, except: [:index]
  end
end
