class ShopsController < ApplicationController
  before_action :set_shop, only: [:get_item_list]

  def get_item_list
    items = FetchShopItems.new(@shop).get_items
    render json: items, status: :ok
  end

  private 
  def set_shop
    @shop = Shop.find(params[:id])
  end
end
