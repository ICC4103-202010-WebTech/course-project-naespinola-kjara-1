Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events do
        resources :comments, shallow: true
        resources :dates_to_votes
      end
    end
  end
  resources :organizations
  resource :user do
    resources :profiles, shallow: true
    resources :mailboxes, shallow: true

  end


  resource :user, defaults: {format: :html}
  resources :mailboxes, defaults: {format: :html}
  resources :profiles, defaults: {format: :html}
  resources :events, defaults: {format: :html}
  resources :organizations, defaults: {format: :html}
end