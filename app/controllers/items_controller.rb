class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update, :edit, :destroy]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end

  # def edit
  #   @item = Item.find(params[:id])
  # end

  # def update
  #   @item = Item.find(params[:id])
  #   if @item.update(item_params)
  #     redirect_to @item, notice: 'Item was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, :condition_id, :burden_id,
                                 :area_id, :number_of_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
