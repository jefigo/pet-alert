class AddressesController < ApplicationController
  def index
    @addresses = Address.order('created_at DESC')
  end

  def new
    @address = Address.new
  end

  def show
    @address = Address.find params[:id]
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      flash[:success] = "Place added!"
      redirect_to :root
    else
      render 'new'
    end
  end

  private

  def address_params
    params.require(:address).permit(
      :zip_code,
      :street,
      :country,
      :city,
      :state
    )
  end
end
