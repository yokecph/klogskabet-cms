class AddThemeReferenceToTrailerGallery < ActiveRecord::Migration[5.1]
  def change
  	add_reference :trailer_galleries, :theme, foreign_key: true
  end
end
