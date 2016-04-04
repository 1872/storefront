class CartedProductsController < ApplicationController
  before_action :authenticate_user!

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
    session[:cart_count] = nil
    redirect_to "/carted_products"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "removed")
    session[:cart_count] = nil
    flash[:success] = "Product successfully removed!"
    redirect_to "/carted_products"
  end
end
