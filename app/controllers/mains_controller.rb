class MainsController < ApplicationController

  def index
    @categories = Category.all
    @top_rated_products = Product.order(show_rating: :desc)
    @cat_products = Product.cat
    @dog_products = Product.dog
    @reptile_products = Product.reptile
  end
end
