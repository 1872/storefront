class OrdersController < ApplicationController
  def create
    Order.create(
      user_id: current_user.id,
      quantity: params[:quantity]
    )
  end
end
