json.theme_color gallery.theme.try(:color)
json.kind 'gallery'
json.bilingual gallery.bilingual?
json.extract! gallery, :id, :name, :created_at, :updated_at
json.images gallery.images, partial: 'images/image', as: :image
