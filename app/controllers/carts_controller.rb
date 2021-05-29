class CartsController < ApplicationController
  def add_to_cart
    puts cart_params
    cart = CreateCartService.new(cart_params).create_cart
    render json: cart, status: :ok
  end

  private

  def cart_params
    params.permit(:users_id,:shops_id,cart_items: [:shop_items_id, :quantity])
  end
end
