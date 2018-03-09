class CreateVideoGalleries < ActiveRecord::Migration[5.1]
  def change
    create_table :video_galleries do |t|
      t.string :name, unique: true

      t.timestamps
    end
  end
end
