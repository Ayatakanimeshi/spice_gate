class FirstpagesController < ApplicationController
    skip_before_action :require_login, only: [:firstpage]
    
    def firstpage ;end
end
