class OrderItemsController < ApplicationController

  def index
    @order_items = OrderItem.all
  end

  def new
    @order_item = OrderItem.new(order_id: params[:order_id])
  end

  def create
    # Step 1: Find or create an order
    @order = Order.find_by(id: session[:order_id])
    unless @order
      @order = Order.new()
      unless @order.save
        flash[:status] = :failure
        flash[:result_text] = "Didn't add to the cart"
        flash[:messages] = @order.errors.messages
        redirect_back fallback_location: root_path
        return
      end
      session[:order_id] = @order.id
      puts "Created new order number #{@order.id}"
    else
      puts "Found order number #{@order.id}"
    end

    # If we get here we're guaranteed to have an order
    @order_item = @order.order_items.new(order_item_params)
    if @order_item.save
      flash[:success] = "Product added successfully"
      #reduce_inventory(order_item)
      redirect_to order_items_path
    else
      flash.now[:failure] = "Didn't add to the cart"
      redirect_to product_path(@order_item.product_id), status: :bad_request
    end
  end

  def update
    @order_item = OrderItem.find_by(id: params[:id])
    @order_item.assign_attributes(order_item_params)
    @order_item.save
    # reduce_inventory(order_item)
    redirect_to order_items_path

  end

  #def clear
  #add_inventory(@order_item)
  def show
  end

  def destroy
    @order_item = OrderItem.find_by(id: params[:id])
    @order_item.destroy
    flash[:status] = :success
    flash[:result_text] = "Successfully deleted"
    redirect_to order_items_path
  end

  private
  def order_item_params
    return params.require(:order_item).permit(:quantity, :product_id)
  end
end
