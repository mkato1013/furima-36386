class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_redirect, only: [:index, :create]


  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :address, :telephone, :building).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :address, :telephone, :building).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end


  def set_redirect
    @item = Item.find(params[:item_id])
    return redirect_to root_path if current_user.id == @item.user.id || @item.purchase.present?
  end

end
