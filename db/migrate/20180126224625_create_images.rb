class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :gallery, foreign_key: true
      t.string :title_da
      t.string :title_en
      t.text :description_da
      t.text :description_en
      t.string :source_da
      t.string :source_en

      t.timestamps
    end
  end
end
