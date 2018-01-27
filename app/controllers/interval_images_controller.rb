class IntervalImagesController < ApplicationController
  before_action :set_interval, only: [:index, :new, :create]
  before_action :set_interval_image, only: [:show, :edit, :update, :destroy]

  # GET /interval_images
  # GET /interval_images.json
  def index
    @interval_images = @interval.interval_images.all
  end

  # GET /interval_images/1
  # GET /interval_images/1.json
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
  # POST /interval_images.json
  def create
    @interval_image = @interval.interval_images.new(interval_image_params)

    respond_to do |format|
      if @interval_image.save
        format.html { redirect_to @interval_image, notice: 'Interval image was successfully created.' }
        format.json { render :show, status: :created, location: @interval_image }
      else
        format.html { render :new }
        format.json { render json: @interval_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interval_images/1
  # PATCH/PUT /interval_images/1.json
  def update
    respond_to do |format|
      if @interval_image.update(interval_image_params)
        format.html { redirect_to @interval_image, notice: 'Interval image was successfully updated.' }
        format.json { render :show, status: :ok, location: @interval_image }
      else
        format.html { render :edit }
        format.json { render json: @interval_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interval_images/1
  # DELETE /interval_images/1.json
  def destroy
    @interval_image.destroy
    respond_to do |format|
      format.html { redirect_to @interval_image.interval, notice: 'Interval image was successfully destroyed.' }
      format.json { head :no_content }
    end
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
