class ShopsController < ApplicationController
  before_action :set_shop, only: [:show]
  skip_before_action :require_login, only: [:index, :show]

  def index
    @shops = Shop.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show; end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      Rails.logger.info "Shop saved successfully"
      address = @shop.address
      results = Geocoder.search(address)
      # Geocoderの結果をログに出力
      Rails.logger.info "Geocoder results: #{results.inspect}"
      if results.present?
        coordinates = results.first.coordinates
        # 座標をログに出力
        Rails.logger.info "Coordinates: #{coordinates.inspect}"
        Rails.logger.info "Before update: #{@shop.latitude}, #{@shop.longitude}"
        @shop.update(latitude: coordinates[0], longitude: coordinates[1])
        Rails.logger.info "After update: #{@shop.latitude}, #{@shop.longitude}"
      else
        # Geocoderが結果を返さなかった場合のログ出力
        Rails.logger.info "No results from Geocoder"
      end
      flash[:notice] = '店舗情報を投稿しました。'
      redirect_to new_post_path
    else
      Rails.logger.info "Failed to save shop"
      Rails.logger.info @shop.errors.full_messages
      flash.now[:alert] = '店舗情報の投稿に失敗しました。'
      render :new
    end
  end
  
  
  
  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :prefecture, :business_hour, :shop_img, :latitude, :longitude, :address, closed_days: [])
  end      
end
