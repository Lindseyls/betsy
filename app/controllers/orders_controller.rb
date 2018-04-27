class OrdersController < ApplicationController
  # nic used
  # route controller view

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    session[:order_id] = @order.id
  end


  def show
    @order = Order.find_by(id: params[:id])
  end

  def update
    @order = Order.find_by(id: params[:id])
    @order.assign_attributes(order_params)
    # @order.status = "paid"

    if @order.save
      @order.status = "paid"
      session[:order_id] = nil

      # if @order.save
      flash[:success] = 'Your order has been placed'
      redirect_to order_path
      # end
    else
      flash.now[:status] = :failure
      flash.now[:result_text] = "Please enter the Order details again"
      flash.now[:messages] = @order.errors.messages
      render :edit
    end
  end

  def edit
    if params[:id]
      @order = Order.find_by(id: params[:id])
    else
      @order.Order.new
    end
  end

  def destroy
  end

  private
  def order_params
    params.require(:order).permit(:status, :email, :mail_adr, :cc_name,
      :cc_num, :cc_exp, :cc_cvv, :bill_zip)
    end
  end
