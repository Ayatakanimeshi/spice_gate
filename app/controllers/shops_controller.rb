class ShopsController < ApplicationController
  before_action :set_shop, only: [:show]
  skip_before_action :require_login, only: [:index, :show]

  def index
    @shops = Shop.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)

    # 以下のブラウザの位置情報を取得するコードは不要になります。
    # なぜなら、その位置情報は既にJavaScriptで取得され、hidden_fieldに設定されているためです。

    # @shop.latitude = params[:latitude]
    # @shop.longitude = params[:longitude]

    if @shop.save
      flash[:notice] = '店舗情報を投稿しました。'
      redirect_to new_post_path
    else
      flash.now[:alert] = '店舗情報の投稿に失敗しました。'
      render :new
    end
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :prefecture, :business_hour, :shop_img, :latitude, :longitude, closed_days: [])
  end      
end
