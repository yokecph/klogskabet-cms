json.extract! track, :id, :title, :description, :created_at, :updated_at
json.url attachment_url(track.mp3.url)
json.checksum track.mp3_fingerprint
