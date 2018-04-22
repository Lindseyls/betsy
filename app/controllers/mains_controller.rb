class MainsController < ApplicationController

  def index
    @categories = Category.all
    @products = Product.

  end
end
