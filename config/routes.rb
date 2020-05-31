Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :quests, only: [:create, :show, :index, :update, :destroy], param: :uuid
  resources :users, only: [:create, :show], param: :uuid
end
