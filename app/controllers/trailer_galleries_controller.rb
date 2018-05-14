class TrailerGalleriesController < ApplicationController
  include ThematicController

  before_action :set_trailer_gallery, only: [:show, :edit, :update, :destroy]

  # GET /trailer_galleries
  def index
    @trailer_galleries = @theme.trailer_galleries.all
  end

  # GET /trailer_galleries/1
  # GET /trailer_galleries/1.json
  def show
  end

  # GET /trailer_galleries/new
  def new
    @trailer_gallery = @theme.trailer_galleries.new
  end

  # GET /trailer_galleries/1/edit
  def edit
  end

  # POST /trailer_galleries
  def create
    @trailer_gallery = @theme.trailer_galleries.new(trailer_gallery_params)

    if @trailer_gallery.save
      redirect_to @trailer_gallery, notice: 'Trailer gallery was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /trailer_galleries/1
  def update
    if @trailer_gallery.update(trailer_gallery_params)
      redirect_to @trailer_gallery, notice: 'Trailer gallery was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /trailer_galleries/1
  def destroy
    @trailer_gallery.destroy

    redirect_to @trailer_gallery.theme, notice: 'Trailer gallery was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_trailer_gallery
    @trailer_gallery = TrailerGallery.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def trailer_gallery_params
    params.require(:trailer_gallery).permit(:name)
  end

end
