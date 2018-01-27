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

ActiveRecord::Schema.define(version: 20180126234325) do

  create_table "galleries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["gallery_id"], name: "index_images_on_gallery_id"
  end

  create_table "playlists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["playlist_id"], name: "index_tracks_on_playlist_id"
  end

  create_table "video_galleries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "video_gallery_id"
    t.string "title_da"
    t.string "title_en"
    t.text "description_da"
    t.text "description_en"
    t.string "source_da"
    t.string "source_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["video_gallery_id"], name: "index_videos_on_video_gallery_id"
  end

  add_foreign_key "images", "galleries"
  add_foreign_key "tracks", "playlists"
  add_foreign_key "videos", "video_galleries"
end
