class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = params[:id]
  end
end
