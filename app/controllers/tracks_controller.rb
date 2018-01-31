class TracksController < ApplicationController
  before_action :set_playlist, only: [:index, :new, :create]
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  # GET /tracks
  def index
    @tracks = @playlist.tracks.all
  end

  # GET /tracks/1
  def show
  end

  # GET /tracks/new
  def new
    @track = @playlist.tracks.new
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks
  def create
    @track = @playlist.tracks.new(track_params)

    if @track.save
      redirect_to @track, notice: 'Track was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tracks/1
  def update
    if @track.update(track_params)
      redirect_to @track, notice: 'Track was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tracks/1
  def destroy
    @track.destroy

    redirect_to playlist_tracks_url(@track.playlist), notice: 'Track was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_playlist
    @playlist = Playlist.find(params[:playlist_id])
  end

  def set_track
    @track = Track.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def track_params
    params.require(:track).permit(:title, :description, :mp3)
  end

end
