class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
  end

  def show
    @user = User.find_by(id: params[:id])
    head :not_found unless @user

    @products = @merchant.product
  end

  def edit
  end


end
