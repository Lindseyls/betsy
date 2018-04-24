class MainsController < ApplicationController

  def root
    @categories = Category.all
    @cat_products = Product.cat
    @dog_products = Product.dog
    @reptile_products = Product.reptile
  end
end
