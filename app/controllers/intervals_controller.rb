class IntervalsController < ApplicationController
  before_action :set_timeline, only: [:index, :new, :create]
  before_action :set_interval, only: [:show, :edit, :update, :destroy]

  # GET /intervals
  def index
    @intervals = @timeline.intervals.all
  end

  # GET /intervals/1
  def show
  end

  # GET /intervals/new
  def new
    @interval = @timeline.intervals.new
  end

  # GET /intervals/1/edit
  def edit
  end

  # POST /intervals
  def create
    @interval = @timeline.intervals.new(interval_params)

    if @interval.save
      redirect_to @interval, notice: 'Interval was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /intervals/1
  def update
    if @interval.update(interval_params)
      redirect_to @interval, notice: 'Interval was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /intervals/1
  # DELETE /intervals/1.json
  def destroy
    @interval.destroy

    redirect_to @interval.timeline, notice: 'Interval was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_timeline
    @timeline = Timeline.find(params[:timeline_id])
  end

  def set_interval
    @interval = Interval.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def interval_params
    params.require(:interval).permit(:title_da, :title_en, :subtitle_da, :subtitle_en, :description_da, :description_en)
  end

end
