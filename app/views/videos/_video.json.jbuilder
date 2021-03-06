json.extract! video, :id, :title_da, :title_en, :description_da, :description_en, :subtitle_da, :subtitle_en, :youtube_id, :created_at, :updated_at
json.description_html_da simple_format(video.description_da)
json.description_html_en simple_format(video.description_en)
json.mp4_url video.mp4.try(:url)
json.mp4_poster_url video.mp4_poster.try(:url, :regular)
