class IntervalImagesController < ApplicationController
  before_action :set_interval, only: [:index, :new, :create]
  before_action :set_interval_image, only: [:show, :edit, :update, :destroy]

  # GET /interval_images
  def index
    @interval_images = @interval.interval_images.all
  end

  # GET /interval_images/1
  def show
  end

  # GET /interval_images/new
  def new
    @interval_image = @interval.interval_images.new
  end

  # GET /interval_images/1/edit
  def edit
  end

  # POST /interval_images
  def create
    @interval_image = @interval.interval_images.new(interval_image_params)

    if @interval_image.save
      redirect_to @interval_image, notice: 'Interval image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /interval_images/1
  def update
    if @interval_image.update(interval_image_params)
      redirect_to @interval_image, notice: 'Interval image was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /interval_images/1
  def destroy
    @interval_image.destroy

    redirect_to @interval_image.interval, notice: 'Interval image was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_interval
    @interval = Interval.find(params[:interval_id])
  end

  def set_interval_image
    @interval_image = IntervalImage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def interval_image_params
    params.require(:interval_image).permit(:file, :description_da, :description_en, :source_da, :source_en)
  end

end
