class CartedProductsController < ApplicationController
  def index
    @carted_products = current_user.carted_products.where(status: 'carted')
    if @carted_products.length == 0
      flash[:warning] = "You don't have any items in your cart!"
      redirect_to "/"
    else
      render 'index.html.erb'
    end
  end

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
