class Api::MemesController < ApplicationController

  def create
    @meme = Meme.new(
      image: params[:image],
      top_text: params[:top_text],
      bottom_text: params[:bottom_text]
    )
    if @meme.save
      render "show.json.jb", status: :created
    else
      render json: { errors: @meme.errors.full_messages }, status: :bad_request
    end
  end 

  def show
    @meme = Meme.find_by(params[:id])
    render "show.json.jb"
  end 

end
