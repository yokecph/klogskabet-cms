FactoryBot.define do
  factory :interval_image do
    interval
    description_da "Lorem ipsum dolor sit amet"
    description_en "Lorem ipsum dolor sit amet"
    source_da "FactoryBot"
    source_en "FactoryBot"
    file_file_name "test.jpg"
    file_content_type "image/jpeg"
    file_file_size 1000
    file_updated_at Time.zone.now
    file_fingerprint "md5checksum"
  end

  factory :interval_image_upload, class: IntervalImage do
    description_da "Lorem ipsum dolor sit amet"
    description_en "Lorem ipsum dolor sit amet"
    source_da "FactoryBot"
    source_en "FactoryBot"
  end
end
