class GalleriesController < ApplicationController
  include ThematicController

  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  # GET /galleries
  def index
    @galleries = @theme.galleries.all
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
  end

  # GET /galleries/new
  def new
    @gallery = @theme.galleries.new
  end

  # GET /galleries/1/edit
  def edit
  end

  # POST /galleries
  def create
    @gallery = @theme.galleries.new(gallery_params)

    if @gallery.save
      redirect_to @gallery, notice: 'Gallery was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /galleries/1
  def update
    if @gallery.update(gallery_params)
      redirect_to @gallery, notice: 'Gallery was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /galleries/1
  def destroy
    @gallery.destroy

    redirect_to @gallery.theme, notice: 'Gallery was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def gallery_params
    params.require(:gallery).permit(:name)
  end

end
