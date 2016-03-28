class CartedProductsController < ApplicationController
  def create
    CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    redirect_to "/carted_products"
  end
end
