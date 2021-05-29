class GetShopItemList < BaseQuery
  def perform
    sql_query = "select items.product_category, items.price, shop_items.quantity, 
    shop_items.id from items inner join shop_items on items.id = shop_items.items_id 
    where shop_items.shops_id = #{relation.id}"
    ActiveRecord::Base.connection.execute(sql_query).to_a
  end
end