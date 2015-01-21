class SongsController < ApplicationController
  
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      render json: @song, status: :created
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      head :no_content
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    head :no_content
  end

  private 
    def song_params
      params.require(:song).permit(:url, :wallet_id)
    end
end