class OrdersController < ApplicationController
  # nic used
  # route controller view

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end


  def make_cart
    # TODO: adjust quantity to take user input (form?)
    if current_user
      @order = Order.find_by(user_id: current_user.id, status: 'pending')
      OrderItem.new(product_id: params[:product_id], order_id: @order.id, quantity: 1)

      redirect_to order_path(@order.id)
    else
      new_order = Order.create()

      product = OrderItem.new(product_id: params[:product_id], order_id: new_order.id, quantity: 1)

      product.save

      redirect_to order_path(new_order.id)
    end
  end
  

  def show
    @order = Order.find_by(id: params[:id])
  end

  def update
    # TODO: adjust quantity to take user input (form?)
    # TODO: apply the helper methods from order_item.rb to validate stock before updating the quantity
    if current_user
      @order = Order.find_by(user_id: current_user.id, status: 'pending')

      product_quantity = OrderItem.find_by(product_id: params[:product_id])

      # TODO: possibly change the order item referenced below to the found product quantity

      if @order.order_id == OrderItem.order_id

        product_quantity.quantity += 1

        product_quantity.save

        redirect_to order_path(@order.id)

      else
        product = OrderItem.new(product_id: params[:product_id], order_id: new_order.id, quantity: 1)

        product.save

        redirect_to order_path(new_order.id)
      end


    else
      new_order = Order.create()

      product = OrderItem.new(product_id: params[:product_id], order_id: new_order.id, quantity: 1)

      product.save

      redirect_to order_path(new_order.id)
    end
  end

  def edit
  end

  def destroy
  end

  private
  def order_params
    params.require(:order).permit(:status, :email, :mail_adr, :cc_name,
      :cc_num, :cc_exp, :cc_cvv, :bill_zip)
    end
  end
