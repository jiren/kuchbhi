class UsersController < ApplicationController
  before_filter :current_user

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to edit_user_path(@user)
      flash[:notice] = "Successfully updated!!!"
    else
      render :edit
    end
  end
end
