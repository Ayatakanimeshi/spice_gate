class NearbyShopsController < ApplicationController
    def index
      @shops = Shop.all
    end
  end