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
    @products = @user.product

    head :not_found unless @user
  end

  def edit
  end


end
