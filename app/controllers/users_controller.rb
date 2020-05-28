class UsersController < ApplicationController

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render(status: 200, json: @user)
    else
      render(status: 400, json: @user.errors)
    end
  end


  def user_params
    params.fetch(:user, {}).permit(:username)
  end
end
