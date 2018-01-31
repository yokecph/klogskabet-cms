json.extract! interval, :id, :title_da, :title_en, :subtitle_da, :subtitle_en, :description_da, :description_en, :created_at, :updated_at
json.description_html_da simple_format(interval.description_da)
json.description_html_en simple_format(interval.description_en)
json.images interval.interval_images, partial: 'interval_images/interval_image', as: :interval_image
