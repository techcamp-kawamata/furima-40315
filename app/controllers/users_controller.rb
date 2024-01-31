class UsersController < ApplicationController
  def index
    @users = user.find(params[:id])
  end
end
