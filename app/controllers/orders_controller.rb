class OrdersController < ApplicationController
  # nic used
  # route controller view

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end


  def create
  end

  def save
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
