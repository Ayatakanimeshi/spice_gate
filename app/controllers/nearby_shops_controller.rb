class NearbyShopsController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    @shops = Shop.all

    respond_to do |format|
      format.html # index.html.erbをレンダリング
      format.json { render json: @shops } # JSON形式で@shopsをレンダリング
    end
  end
end
