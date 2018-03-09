json.theme_color playlist.theme.try(:color)
json.kind 'playlist'
json.extract! playlist, :id, :name, :description, :created_at, :updated_at
json.tracks playlist.tracks, partial: 'tracks/track', as: :track
