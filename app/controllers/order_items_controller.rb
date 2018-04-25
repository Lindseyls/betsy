class OrderItemsController < ApplicationController

  def new
    @order_item = OrderItem.new(order_id: params[:order_id])
  end

  def create
    @order = Order.find_by(id: session[:order_id])
    if @order

      @order_item = @order.order_items.new(order_item_params)

      @order_item.order_id = @order.order_id

    elsif @order.nil?
      new_order = Order.new()
      if new_order.save
        new_order_item = new_order.order_items.new(order_item_params)
        print new_order_item
        new_order_item.save

      else
        flash.now[:failure] = "Didn't add to the cart"
        redirect_to product_path(@product)
      end


      if @order_item.save
        flash[:success] = "Product added successfully"
        redirect_to order_path
      else
        flash.now[:failure] = "Didn't add to the cart"
        redirect_to product_path(@product), status: :bad_request
      end
    end
  end

  def update
    @order_item = OrderItem.find_by(id: params[:id])

    @order_item.update(id: params[:id], shipped: true)
    redirect_to user_path
  end

  private
  def order_item_params
    return params.require(:order_item).permit(:quantity, :product_id)
  end
end
