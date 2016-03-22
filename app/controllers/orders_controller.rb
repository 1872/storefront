class OrdersController < ApplicationController
  def create
    @order = Order.create(
      user_id: current_user.id,
      quantity: params[:quantity],
      product_id: params[:product_id]
    )
    flash[:success] = "Order successfully created!"
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
