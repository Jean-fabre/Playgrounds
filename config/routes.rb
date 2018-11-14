Rails.application.routes.draw do
  resources :events
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show] do

    resources :players
    resources :reviews
    resources :events
  end
  get 'calendar_events', to: 'events#events_to_calendar'
  resources :clubs do
    resources :fields do
      resources :events
    end
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
