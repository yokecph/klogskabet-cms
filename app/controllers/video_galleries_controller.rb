class VideoGalleriesController < ApplicationController
  include ThematicController

  before_action :set_video_gallery, only: [:show, :edit, :update, :destroy]

  # GET /video_galleries
  def index
    @video_galleries = @theme.video_galleries.all
  end

  # GET /video_galleries/1
  # GET /video_galleries/1.json
  def show
  end

  # GET /video_galleries/new
  def new
    @video_gallery = @theme.video_galleries.new
  end

  # GET /video_galleries/1/edit
  def edit
  end

  # POST /video_galleries
  def create
    @video_gallery = @theme.video_galleries.new(video_gallery_params)

    if @video_gallery.save
      redirect_to @video_gallery, notice: 'Video gallery was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /video_galleries/1
  def update
    if @video_gallery.update(video_gallery_params)
      redirect_to @video_gallery, notice: 'Video gallery was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /video_galleries/1
  def destroy
    @video_gallery.destroy

    redirect_to @video_gallery.theme, notice: 'Video gallery was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_video_gallery
    @video_gallery = VideoGallery.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def video_gallery_params
    params.require(:video_gallery).permit(:name)
  end

end
