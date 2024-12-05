class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, :condition_id, :burden_id,
                                 :area_id, :number_of_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
