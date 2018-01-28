class TimelinesController < ApplicationController
  include ThematicController

  before_action :set_timeline, only: [:show, :edit, :update, :destroy]

  # GET /timelines
  def index
    @timelines = @theme.timelines.all
  end

  # GET /timelines/1
  # GET /timelines/1.json
  def show
  end

  # GET /timelines/new
  def new
    @timeline = @theme.timelines.new
  end

  # GET /timelines/1/edit
  def edit
  end

  # POST /timelines
  def create
    @timeline = @theme.timelines.new(timeline_params)

    if @timeline.save
      redirect_to @timeline, notice: 'Timeline was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /timelines/1
  def update
    if @timeline.update(timeline_params)
      redirect_to @timeline, notice: 'Timeline was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /timelines/1
  def destroy
    @timeline.destroy

    redirect_to @timeline.theme, notice: 'Timeline was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_timeline
    @timeline = Timeline.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def timeline_params
    params.require(:timeline).permit(:name, :title_da, :title_en)
  end

end
