json.extract! image, :id, :title_da, :title_en, :description_da, :description_en, :source_da, :source_en, :created_at, :updated_at
json.description_html_da simple_format(image.description_da)
json.description_html_en simple_format(image.description_en)
json.url image.file.url(:regular)
json.checksum image.file_fingerprint
