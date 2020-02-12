class MerchantsController <ApplicationController

  def new
  end

  def create
    merchant = Merchant.new(merchant_params)
    merchant.save

    redirect_to '/merchants'
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
  end

  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(merchant_params)
    merchant.save

    redirect_to "/merchants/#{params[:id]}"
  end

  def destroy
    item = Item.where(merchant_id: params[:id])
    Item.delete(item)
    Merchant.destroy(params[:id])

    redirect_to '/merchants'
  end

  private

  def merchant_params
    params.permit(:name, :address, :city, :state, :zip)
  end

end
