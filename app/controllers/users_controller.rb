class UsersController < ApplicationController
  include Knock::Authenticable
  before_action :set_user, only: [:show]

  # POST /users
  def create
    user = User.new(user_create_params)
    if user.save
      render(status: 200, json: user)
    else
      render(status: 400, json: user.errors)
    end
  end

  # GET /users/:uuid
  def show
    render(status: 200, json: @user)
  end

  private
    def user_create_params
      params.fetch(:user, {}).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation, :phone_number)
    end

    def user_get_params
      params.permit(:uuid)
    end

    def set_user
      @user = User.find_by(uuid: user_get_params[:uuid])
      if @user.nil?
        render(status: 404, json: {message: I18n.t("api.unfound")})
        return
      end
    end
end
