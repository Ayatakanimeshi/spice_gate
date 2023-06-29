class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true , presence: true
  validates :name, presence: true
  validates :age, presence: true
  validates :live_prefecture, presence: true
  validates :tolerance, presence: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  mount_uploader :profile_img, ProfImageUploader

  def own?(object)
    id == object.user_id
  end

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  def self.search(search)
    if search
      User.where(['name LIKE ?', "%#{search}%"])
    else
      User.all
    end
  end
end
