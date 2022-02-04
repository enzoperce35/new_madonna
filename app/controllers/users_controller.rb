class UsersController < ApplicationController
  def update
    user = User.find(params[:id])

    if user.update(user_params)
      redirect_to root_path, notice: 'Administrative branch updated!'
    else
      redirect_to root_path, notice: 'failed to update branch'
    end
  end

  private

  def user_params
    params.require(:user).permit(:branch)
  end
end
