class AddFingerprintsToAttachments < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :file_fingerprint, :string
    add_column :interval_images, :file_fingerprint, :string
    add_column :tracks, :mp3_fingerprint, :string
  end
end
