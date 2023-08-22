class NearbyShopsController < ApplicationController
    skip_before_action :require_login, only: [:index]
    def index
      @shops = Shop.all
    end
  end