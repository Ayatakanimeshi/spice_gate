class Post < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  mount_uploader :curry_img, CurryImageUploader
end
