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
    if session.nil?
      # add the product to the session ("cart")
      # redirect to cart/order view

      session[:user_id]
      redirect_to cart_path

    else
      # is session not nil?
      session[:product_id] << @order_items.product_id
      redirect_to cart_path
    end
  end

  def create
    # on the order page, have button for proceed to checkout or continue shopping

    # @order = Order.new(order_params)
    # if @order.save
    #   flash[:success] = "Thanks for ordering with Petsy!"
    #   redirect_to order_path(@order.id)
    # else
    #   flash[:error] = "Sorry, something went wrong"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def update
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
