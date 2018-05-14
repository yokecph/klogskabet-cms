class CreateTrailerGalleries < ActiveRecord::Migration[5.1]
  def change
    create_table :trailer_galleries do |t|
      t.string :name, unique: true

      t.timestamps
    end
  end
end
