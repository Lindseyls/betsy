class OrderItemsController < ApplicationController

  def new
    @order_item = OrderItem.new(order_id: params[:order_id])
  end

  def create
    @order_item = OrderItem.new(order_item_params)

    if @order_item.save
      flash[:success] = "Product added successfully"
      redirect_to order_item_path
    else
      flash.now[:failure] = "Didn't add to the cart"
      render :new, status: :bad_request
    end

  end

  def update
    @order_item = OrderItem.find_by(id: params[:id])

    @order_item.update(id: params[:id], shipped: true)
    redirect_to user_path
  end

  private
  def order_item_params
    params.require(:order_item).permit(:quantity, :order_id, :product_id)
  end
end
