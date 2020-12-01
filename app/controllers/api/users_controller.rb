class Api::UsersController < ApplicationController

  def create
    @user = User.new(
        username: params[:username],
        # password: params[:password],
        password_digest: params[:password_digest]
      )
    if @user.save
      render "show.json.jb", status: :created
    else
      render json: { errors: @user.errors.full_messages}, status: :bad_request
    end 
  end

  def show
    @user = User.find(params[:id])
    render "show.json.jb"
  end 
  
end
