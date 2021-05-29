class CreateCartService
  attr_accessor :params
  def initialize(params)
    @params = params
  end

  def create_cart
    ActiveRecord::Base.transaction do
      cart_creation
      create_cart_items
    end
  end

  private

  def cart_creation
    @cart = Cart.create!(cart_params)
  end

  def create_cart_items
    params[:cart_items].each do |citem|
      CartItem.create!(citem.merge!({carts_id: @cart.id}))
    end
  end

  def cart_params
    {
      users_id: params[:users_id], 
      shops_id: params[:shops_id],
      total_price: calculate_total_cart_price
    }
  end

  def calculate_total_cart_price
    price = 0
    shop_items = shop_cart_items_list.compact
    shop_items.each do |item|
      ci = params[:cart_items].select{|c| c[:shop_items_id] == item["id"]}.first
      price += ci[:quantity]*item["price"] if !ci.nil?
    end
    price
  end

  def shop_cart_items_list
    cart_item_id = params[:cart_items].map{|i| i[:shop_items_id]}
    shop = Shop.find(params[:shops_id])
    GetShopItemList.new(shop).perform.map{|a| a if cart_item_id.include?(a["id"])}
  end

end