class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      Payjp.api_key = 'sk_test_7ce2cfc5c138faaca0496cc6' # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: order_form_params[:token], # カードトークン
        currency: 'jpy' # 通貨の種類（日本円）
      )
      @order_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(:post_code, :area_id, :municipality, :street_address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end
end
