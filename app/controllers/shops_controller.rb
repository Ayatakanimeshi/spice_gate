class ShopsController < ApplicationController
    before_action :set_shop, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:index, :show]
  
    def new
      @shop = Shop.new
    end
  
    def create
      @shop = Shop.new(shop_params)
      if @shop.save
        redirect_to @shop, notice: '店舗情報を投稿しました。'
      else
        render :new
      end
    end
  
    def show
    end
  
    def index
      @shops = Shop.all
    end
  
    private
  
    def set_shop
      @shop = Shop.find(params[:id])
    end
  
    def shop_params
      params.require(:shop).permit(:name, :prefecture, :business_hour, closed_days: [], :shop_img, :latitude, :longitude)
    end
  end
  