class AddThemeReferenceToContentModels < ActiveRecord::Migration[5.1]
  def change
    add_reference :timelines, :theme, foreign_key: true
    add_reference :galleries, :theme, foreign_key: true
    add_reference :video_galleries, :theme, foreign_key: true
    add_reference :quizzes, :theme, foreign_key: true
    add_reference :playlists, :theme, foreign_key: true
  end
end
