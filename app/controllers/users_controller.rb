class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def maypage
    redirect_to user_path(current_user)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = "更新しました"
      redirect_to root_path
    else
      render "edit"
    end
  end
  
  private

  def user_params
    params.require(:user).permit(
      :username,
      :profile,
      :image
    )
  end
end
