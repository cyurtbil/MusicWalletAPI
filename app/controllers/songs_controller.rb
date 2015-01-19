class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      render json: @song, status: :created
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