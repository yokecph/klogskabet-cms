json.extract! trailer, :id, :title_da, :title_en, :description_da, :description_en, :subtitle_da, :subtitle_en, :url, :youtube_id, :created_at, :updated_at
json.description_html_da simple_format(trailer.description_da)
json.description_html_en simple_format(trailer.description_en)
json.mp4_url trailer.mp4.try(:url)
