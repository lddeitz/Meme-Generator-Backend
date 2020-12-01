class Api::UsersController < ApplicationController

  before_action :authenticate_user, :except => [:create]

  def create
    @user = User.new(
        username: params[:username],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
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
