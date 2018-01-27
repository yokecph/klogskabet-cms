json.extract! video, :id, :video_gallery_id, :title_da, :title_en, :description_da, :description_en, :source_da, :source_en, :created_at, :updated_at
json.url video_url(video, format: :json)
