Rails.application.routes.draw do


  root "pages#home"
  devise_for :users, :controllers =>{ :omniauth_callbacks => "omniauth_callbacks" }

  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #  get 'mailbox/show'
  get 'member/index'
  get 'member/show'
  get 'member/new'
  get 'member/edit'
  get 'member/create'
  get 'member/update'
  get 'member/destroy'



  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events do
          resources :comments
      end
    end
  end


  resources :users

  resources :dates_to_votes do
      resources :votes, shallow: true
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

  resources :organizations do
    resources :members , shallow: true
  end

  resources :events do
    resources :reports, shallow: true
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
  resources :dates_to_votes, defaults:{format: :html}
  resources :comments, defaults:{format: :html}
  resources :mailbox, defaults:{format: :html}
  resources :tos, defaults:{format: :html}


  #resources :participants, defaults: {format: :html}
  get '/search' => 'pages#search', :as => 'search_page'
  get '/mailbox', to:'mailbox#show'

  get '/aup', to:'aup#index'


  match 'participants', to: "participants#participants", via: [:post, :get]
end