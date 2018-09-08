class AddressesController < ApplicationController
  before_action :find_user

  def index
    @addresses = @user.addresses
  end

  def new
    @address = Address.new
  end

  def show
    @address = Address.find params[:id]
  end

  def create
    if Address.create(address_params.merge(user_id: @user.id))
      flash[:success] = "Place added!"
      redirect_to user_path(@user)
    else
      redirect_to :back
    end
  end

  private

  def find_user
    @user = User.find params[:user_id]
  end

  def address_params
    params.require(:address).permit(:city,
                                    :country,
                                    :state,
                                    :street,
                                    :zip_code)
  end
end
