json.extract! interval_image, :id, :description_da, :description_en, :source_da, :source_en, :created_at, :updated_at
json.url attachment_url(interval_image.file.url(:regular))
json.checksum interval_image.file_fingerprint
