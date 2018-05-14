class CreateTrailers < ActiveRecord::Migration[5.1]
  def change
    create_table :trailers do |t|
      t.references :trailer_gallery, foreign_key: true
      t.string :title_da
      t.string :title_en
      t.text :description_da
      t.text :description_en
      t.string :subtitle_da
      t.string :subtitle_en
      t.string :url
      t.string :youtube_id
      t.attachment :mp4

      t.timestamps
    end
  end
end
