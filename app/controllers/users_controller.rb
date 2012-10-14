class UsersController < ApplicationController
  before_filter :current_user

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.attributes = params[:user]
    @user.save
  end
end
