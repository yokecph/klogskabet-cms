class AddMp3ToTracks < ActiveRecord::Migration[5.1]
  def up
    add_attachment :tracks, :mp3
  end

  def down
    remove_attachment :tracks, :mp3
  end
end
