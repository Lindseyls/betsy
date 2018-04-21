class Order < ApplicationRecord


  #------ Unauthorized User
  # Orders have many products, Product has many orders
  # Intermediary table where OrderProduct contains foreign keys for product, and order, and quantity
    # functionality should include the total cost of the order
  # Orders have product name, product id, merchant id?

  # order fulfillment view could include (accessible to authorized user):
    # -product info
    # -merchant info


    #  end

#------ Authorized User
# order fulfillment view could include (accessible to authorized user):
  # -product info
  # -merchant info
  # -order status

# link to the user
# link to the item description page
end
