class PurchasesController < ApplicationController

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture, :city, :address, :telephone).merge(user_id: current_user.id, item_id: item.id)
  end

end