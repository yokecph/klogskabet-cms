class ImagesController < ApplicationController
  before_action :set_gallery, only: [:index, :new, :create]
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  def index
    @images = @gallery.images.all
  end

  # GET /images/1
  def show
  end

  # GET /images/new
  def new
    @image = @gallery.images.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  def create
    @image = @gallery.images.new(image_params)

    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      redirect_to @image, notice: 'Image was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy

    redirect_to @image.gallery, notice: 'Image was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def set_image
    @image = Image.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    params.require(:image).permit(:file, :title_da, :title_en, :description_da, :description_en, :source_da, :source_en)
  end

end
