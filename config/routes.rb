# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resource :account, except: [:new, :create]

  resources :users, except: [:edit, :update], constraints: { id: /\d+/ }
  devise_for :users

  resources :devices

  get 'assignments/:content_class/:content_id/select', controller: :assignments, action: :select, as: :select_device
  post 'assignments/assign', controller: :assignments, action: :assign, as: :assign_device

  resources :themes, shallow: true do
    resources :quizzes

    resources :timelines, shallow: true do
      resources :intervals, except: :index, shallow: true do
        resources :interval_images, except: :index
      end
    end

    resources :video_galleries, shallow: true do
      resources :videos, except: :index
    end

    resources :trailer_galleries, shallow: true do
      resources :trailers, except: :index
    end

    resources :galleries, shallow: true do
      resources :images, except: :index
    end

    resources :playlists, shallow: true do
      resources :tracks, except: [:index, :show]
    end
  end

  namespace :api do
    resources :devices, only: [:show, :update], constraints: { id: /[a-z0-9_-]+/i }

    get 'patron', to: 'cicero#show'
  end

  root to: 'themes#index'
end
