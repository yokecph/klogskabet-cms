class VideosController < ApplicationController
  before_action :set_video_gallery, only: [:index, :new, :create]
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos/1
  def show
  end

  # GET /videos/new
  def new
    @video = @video_gallery.videos.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  def create
    @video = @video_gallery.videos.new(video_params)

    if @video.save
      redirect_to @video, notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /videos/1
  def update
    if @video.update(video_params)
      redirect_to @video, notice: 'Video was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /videos/1
  def destroy
    @video.destroy

    redirect_to @video.video_gallery, notice: 'Video was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_video_gallery
    @video_gallery = VideoGallery.find(params[:video_gallery_id])
  end

  def set_video
    @video = Video.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def video_params
    params.require(:video).permit(:title_da, :title_en, :description_da, :description_en, :subtitle_da, :subtitle_en, :youtube_id, :mp4, :mp4_poster)
  end

end
