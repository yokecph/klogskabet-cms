# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :galleries
  resources :playlists, shallow: true do
    resources :tracks
  end
end
