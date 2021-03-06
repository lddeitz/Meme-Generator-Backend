class Api::MemesController < ApplicationController

  before_action :authenticate_user, :except => [:index]

  def index
    @memes = Meme.all
    render "index.json.jb"
  end 

  def create
    @meme = Meme.new(
      image: params[:image],
      top_text: params[:top_text],
      bottom_text: params[:bottom_text],
      user_id: current_user.id
    )
    if @meme.save
      render "show.json.jb", status: :created
    else
      render json: { errors: @meme.errors.full_messages }, status: :bad_request
    end
  end 

  def show
    @meme = Meme.find(params[:id])
    render "show.json.jb"
  end 

  # Go check if we have current user logic in there for line 31

  def update
    @meme = Meme.find(params[:id])

    if @meme.user_id === current_user.id
      @meme.image = params[:image] || @meme.image 
      @meme.top_text = params[:top_text] || @meme.top_text 
      @meme.bottom_text = params[:bottom_text] || @meme.bottom_text
      @meme.user_id = current_user.id
    end

    if @meme.save 
      render "show.json.jb"
    else
      render json: { errors: @meme.errors.full_messages }, status: :bad_request
    end 
  end

  def destroy
    @meme = Meme.find(params[:id])
    @meme.destroy
    render json: { message: "Meme successfully destroyed" }
  end

end
