class RenameSourceInVideos < ActiveRecord::Migration[5.1]
  def change
    rename_column :videos, :source_da, :subtitle_da
    rename_column :videos, :source_en, :subtitle_en
  end
end
