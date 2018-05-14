json.theme_color trailer_gallery.theme.try(:color)
json.kind 'trailer_gallery'
json.bilingual trailer_gallery.bilingual?
json.extract! trailer_gallery, :id, :name, :created_at, :updated_at
json.trailers trailer_gallery.trailers, partial: 'trailers/trailer', as: :trailer
