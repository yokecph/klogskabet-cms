# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180131174202) do

  create_table "devices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "kind"
    t.datetime "last_contact"
    t.string "eth_ip"
    t.string "wlan_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content_type"
    t.bigint "content_id"
    t.index ["content_type", "content_id"], name: "index_devices_on_content_type_and_content_id"
  end

  create_table "galleries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "theme_id"
    t.index ["theme_id"], name: "index_galleries_on_theme_id"
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "gallery_id"
    t.string "title_da"
    t.string "title_en"
    t.text "description_da"
    t.text "description_en"
    t.string "source_da"
    t.string "source_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.string "file_fingerprint"
    t.index ["gallery_id"], name: "index_images_on_gallery_id"
  end

  create_table "interval_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "interval_id"
    t.text "description_da"
    t.text "description_en"
    t.string "source_da"
    t.string "source_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.string "file_fingerprint"
    t.index ["interval_id"], name: "index_interval_images_on_interval_id"
  end

  create_table "intervals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "timeline_id"
    t.string "title_da"
    t.string "title_en"
    t.string "subtitle_da"
    t.string "subtitle_en"
    t.text "description_da"
    t.text "description_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timeline_id"], name: "index_intervals_on_timeline_id"
  end

  create_table "playlists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "theme_id"
    t.index ["theme_id"], name: "index_playlists_on_theme_id"
  end

  create_table "quiz_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "quiz_id"
    t.string "option_da"
    t.string "option_en"
    t.string "answer_da"
    t.string "answer_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_quiz_options_on_quiz_id"
  end

  create_table "quizzes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "title_da"
    t.string "title_en"
    t.string "subtitle_da"
    t.string "subtitle_en"
    t.string "result_title_da"
    t.string "result_title_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "theme_id"
    t.index ["theme_id"], name: "index_quizzes_on_theme_id"
  end

  create_table "themes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timelines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "title_da"
    t.string "title_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "theme_id"
    t.index ["theme_id"], name: "index_timelines_on_theme_id"
  end

  create_table "tracks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "playlist_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mp3_file_name"
    t.string "mp3_content_type"
    t.integer "mp3_file_size"
    t.datetime "mp3_updated_at"
    t.string "mp3_fingerprint"
    t.index ["playlist_id"], name: "index_tracks_on_playlist_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "video_galleries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "theme_id"
    t.index ["theme_id"], name: "index_video_galleries_on_theme_id"
  end

  create_table "videos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "video_gallery_id"
    t.string "title_da"
    t.string "title_en"
    t.text "description_da"
    t.text "description_en"
    t.string "subtitle_da"
    t.string "subtitle_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "youtube_id"
    t.index ["video_gallery_id"], name: "index_videos_on_video_gallery_id"
  end

  add_foreign_key "galleries", "themes"
  add_foreign_key "images", "galleries"
  add_foreign_key "interval_images", "intervals"
  add_foreign_key "intervals", "timelines"
  add_foreign_key "playlists", "themes"
  add_foreign_key "quiz_options", "quizzes"
  add_foreign_key "quizzes", "themes"
  add_foreign_key "timelines", "themes"
  add_foreign_key "tracks", "playlists"
  add_foreign_key "video_galleries", "themes"
  add_foreign_key "videos", "video_galleries"
end
