json.theme_color video_gallery.theme.try(:color)
json.kind 'video_gallery'
json.extract! video_gallery, :id, :name, :created_at, :updated_at
json.videos video_gallery.videos, partial: 'videos/video', as: :video
