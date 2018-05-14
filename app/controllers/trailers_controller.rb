class TrailersController < ApplicationController
  before_action :set_trailer_gallery, only: [:index, :new, :create]
  before_action :set_trailer, only: [:show, :edit, :update, :destroy]

  # GET /trailers/1
  def show
  end

  # GET /trailers/new
  def new
    @trailer = @trailer_gallery.trailers.new
  end

  # GET /trailers/1/edit
  def edit
  end

  # POST /trailers
  def create
    @trailer = @trailer_gallery.trailers.new(trailer_params)

    if @trailer.save
      redirect_to @trailer, notice: 'Trailer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /trailers/1
  def update
    if @trailer.update(trailer_params)
      redirect_to @trailer, notice: 'Trailer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /trailers/1
  def destroy
    @trailer.destroy

    redirect_to @trailer.trailer_gallery, notice: 'Trailer was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_trailer_gallery
    @trailer_gallery = TrailerGallery.find(params[:trailer_gallery_id])
  end

  def set_trailer
    @trailer = Trailer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def trailer_params
    params.require(:trailer).permit(:title_da, :title_en, :description_da, :description_en, :subtitle_da, :subtitle_en, :url, :youtube_id, :mp4)
  end

end
