class CreateIntervals < ActiveRecord::Migration[5.1]
  def change
    create_table :intervals do |t|
      t.references :timeline, foreign_key: true
      t.string :title_da
      t.string :title_en
      t.string :subtitle_da
      t.string :subtitle_en
      t.text :description_da
      t.text :description_en

      t.timestamps
    end
  end
end
