class CategoriesController < ApplicationController
  def index
  @products_by_categories = Category.to_category_hash
end

def new
  @category = Category.new
end

def create
  @category = Category.new(category_params)
  @category.save
end

private
def category_params
  params.require(:category).permit(:name, :product_id)
end


end
