class UsersController < ApplicationController
  before_action :validate_current_user

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def validate_current_user
    redirect_to root_path unless current_user.id == params[:id].to_i
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :phone_number,
      :avatar,
      addresses_attributes: [:id, :street, :city, :state, :country, :zip_code]
    )
  end
end
