class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def create
    @song = Song.find(params[:id])

    if @song.save
      render json: @song, status: :created
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  private 
    def song_params
      params.require(:song).permit(:name, :wallet_id)
    end
end