class ItemsController<ApplicationController

  def new
    require "pry"; binding.pry
    if params[:merchant_id]
      @merchant = Merchant.find(params[:merchant_id])
    end
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    Item.create(name: params[:name],
              description: params[:description],
              price: params[:price],
              image: params[:image],
              inventory: params[:inventory],
              active_inactive: true)
    redirect_to "/merchants/#{merchant.id}/items"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to "/items/params[:id]"
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.permit(:name, :description, :price, :image, :inventory, active_inactive: true)
  end


end
