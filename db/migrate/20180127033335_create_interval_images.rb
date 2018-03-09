class CreateIntervalImages < ActiveRecord::Migration[5.1]
  def change
    create_table :interval_images do |t|
      t.references :interval, foreign_key: true
      t.text :description_da
      t.text :description_en
      t.string :source_da
      t.string :source_en

      t.timestamps
    end

    add_attachment :interval_images, :file
  end
end
