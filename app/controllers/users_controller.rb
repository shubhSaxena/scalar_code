class UsersController < ApplicationController
  before_action :set_user, only: [:get_nearby_shops, :login]
  
  def create
    user = User.new(user_params)
    if user.valid?
      user.save!
      render json: {success: true}, status: :created
    else
      render json: {success: false, error: user.errors.messages}, status: :unprocessable_entity
    end
  end

  def login

  end

  def get_nearby_shops
    shops = FetchNearbyShopService.new(@user).get_shops_list
    render json: shops, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:phone,:password,:type)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
