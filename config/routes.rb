Rails.application.routes.draw do
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
    resources :profiles, shallow: true
    resources :messages, shallow: true
  end
  resources :organizations


  resource :user, defaults: {format: :html}
  resources :messages, defaults: {format: :html}
  resources :profiles, defaults: {format: :html}
  resources :events, defaults: {format: :html} do
    resources :dates_to_votes, defaults: {format: :html}
  end
  resources :organizations, defaults: {format: :html}
  resources :guests, defaults: {format: :html}
  resources :votes, defaults:{format: :html}
end