class OrderItemsController < ApplicationController

  def new
    @order_item = OrderItem.new(order_id: params[:order_id])
  end

  def create
    @order = Order.find_by(id: session[:order_id])
    # TODO: what if order DNE
    @order_item = @order.order_items.new(order_item_params)

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
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
