Rails.application.routes.draw do
  get 'participants/participants'
  get 'search/search'
  devise_for :users
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events do
          resources :comments
      end
    end
  end



  resource :user do
    resources :messages, shallow: true
  end

  resources :events do
    resources :dates_to_votes, shallow: true
  end
  resources :events do
    resources :comments, shallow: true
  end

  resources :events do
    resources :guests, shallow: true
  end

  # namespace :admin do
  #  resources :organizations
  #end


  resource :user, defaults: {format: :html}
  resources :messages, defaults: {format: :html}
  resources :events, defaults: {format: :html} 
  resources :organizations, defaults: {format: :html}
  resources :guests, defaults: {format: :html}
  resources :votes, defaults:{format: :html}

  #resources :participants, defaults: {format: :html}
  get '/search' => 'pages#search', :as => 'search_page'

  match 'participants', to: "participants#participants", via: [:post, :get]
end