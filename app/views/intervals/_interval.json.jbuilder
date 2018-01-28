json.extract! interval, :id, :title_da, :title_en, :subtitle_da, :subtitle_en, :description_da, :description_en, :created_at, :updated_at
json.images interval.interval_images, partial: 'interval_images/interval_image', as: :interval_image
