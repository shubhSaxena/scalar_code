class FetchShopItems
  attr_accessor :shop
  def initialize(shop)
    @shop = shop
  end

  def get_items
    GetShopItemList.new(shop).perform
  end

end