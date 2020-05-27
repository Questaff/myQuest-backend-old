Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :quests, only: [:create, :show, :index], param: :uuid
  resources :users, only: [:create]
end
