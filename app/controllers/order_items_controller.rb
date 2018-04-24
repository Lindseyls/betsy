class OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find_by(id: params[:id])

    @order_item.update(id: params[:id], shipped: true)
    redirect_to user_path
  end
end
