class AssignmentsController < ApplicationController
  before_action :load_content
  before_action :load_device, only: :assign

  def select
    @devices = Device.where(kind: content_class.required_device_kind).order(:name)
  end

  def assign
    if @content.assignable_to?(@device) && @device.update_attribute(:content, @content)
      redirect_to @content, notice: 'Content succesfully assigned to device'
    else
      redirect_to @content, alert: 'Could not assign content to device'
    end
  end

  private

  def content_class
    klass = params[:content_class].classify.constantize
    [Gallery, Playlist, Quiz, Timeline, VideoGallery, TrailerGallery].include?(klass) ? klass : nil
  end

  def load_content
    @content = content_class.find(params[:content_id])
  end

  def load_device
    @device = Device.find(params[:device_id])
  end
end
