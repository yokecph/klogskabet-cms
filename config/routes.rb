# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    resources :devices, only: [:show, :update], constraints: { id: /[a-z0-9_-]+/i }
  end

  resources :devices

  get 'assignments/:content_class/:content_id/select', controller: :assignments, action: :select, as: :select_device
  post 'assignments/assign', controller: :assignments, action: :assign, as: :assign_device

  resources :themes, shallow: true do
    resources :quizzes

    resources :timelines, shallow: true do
      resources :intervals, shallow: true do
        resources :interval_images
      end
    end

    resources :video_galleries, shallow: true do
      resources :videos
    end

    resources :galleries, shallow: true do
      resources :images
    end

    resources :playlists, shallow: true do
      resources :tracks
    end
  end

  root to: 'themes#index'
end
