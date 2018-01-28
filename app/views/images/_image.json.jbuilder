json.extract! image, :id, :title_da, :title_en, :description_da, :description_en, :source_da, :source_en, :created_at, :updated_at
json.url image.file.url(:regular)
json.checksum image.file_fingerprint
