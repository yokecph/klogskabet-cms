class AddAttachmentMp4PosterToVideos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :videos do |t|
      t.attachment :mp4_poster
    end
  end

  def self.down
    remove_attachment :videos, :mp4_poster
  end
end
