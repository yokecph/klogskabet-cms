# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  namespace :api do
    resources :devices, only: [:show, :update], constraints: { id: /[a-z0-9_-]+/i }
  end

  resources :devices

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
end
