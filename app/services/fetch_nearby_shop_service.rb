class FetchNearbyShopService
  attr_accessor :user, :range
  def initialize(user, range=3)
    @user = user
    @range = range
  end

  def get_shops_list
    GetLocationRangeValues.new(Shop).perform(calculate_range)
  end

  private

  def calculate_range
    [get_user_location - range, get_user_location + range]
  end

  def get_user_location
    @get_user_location ||= 
    Address
      .select(:location)
      .where(users_id: user.id, active: true)
      .first
      .location.to_i
  end
end