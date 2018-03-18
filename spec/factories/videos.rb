FactoryBot.define do
  factory :video do
    video_gallery
    title_da "Dansk titel"
    title_en "English Title"
    subtitle_da "Foobar"
    subtitle_en "Foobar"
    description_da "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    description_en "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    youtube_id "C0DPdy98e4c" # simple test video
    mp4_file_name "test.mp4"
    mp4_content_type "video/mp4"
    mp4_file_size 10000
    mp4_updated_at Time.zone.now
    mp4_poster_file_name "test.png"
    mp4_poster_content_type "image/png"
    mp4_poster_file_size 1000
    mp4_poster_updated_at Time.zone.now
  end
end
