class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:index, :show]

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:notice] = '店舗情報を投稿しました。'
      redirect_to new_post_path
    else
      flash.now[:alert] = '店舗情報の投稿に失敗しました。'
      render :new
    end
  end

  def show
  end

  def index
    @shops = Shop.order(created_at: :desc).page(params[:page]).per(5)
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :prefecture, :business_hour, :shop_img, :latitude, :longitude, closed_days: [])
  end      
end
