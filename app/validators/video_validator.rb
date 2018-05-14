
class VideoValidator < ActiveModel::Validator
  def validate(record)
    if record.mp4.blank? && record.youtube_id.blank?
      record.errors[:base] << 'The video must have either a YouTube ID or MP4 video file'
    end
  end
end
