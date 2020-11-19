class UsersController < ApplicationController

  def create
    @user = User.new(
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
  if @user.save
    render "show.json.jb", status: :saved
  else
    render json: { errors: @user.errors.full_messages}, status: :bad_request
  end 
  
end
