json.extract! image, :id, :gallery_id, :title_da, :title_en, :description_da, :description_en, :source_da, :source_en, :created_at, :updated_at
json.url image_url(image, format: :json)