Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :user do
        resources :mailboxes, shallow: true
      end
      resources :events do
        resources :comments, shallow: true
        resources :dates_to_votes
      end

      resources :organizations
    end

    resource :user, defaults: {format: :html}
    resources :events, defaults: {format: :html}
    resources :organizations, defaults: {format: :html}

  end
end