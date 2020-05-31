Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/quests/created_quests', to: 'quests#created_quests'
  get '/quests/accepted_quests', to: 'quests#accepted_quests'
  get '/quests/stored_quests', to: 'quests#stored_quests'

  resources :quests, only: [:create, :show, :index, :update, :destroy], param: :uuid
  resources :users, only: [:create, :show], param: :uuid
end
