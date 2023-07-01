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

  enum age: { "10代": 0, "20代": 1, "30代": 2, "40代": 3, "50代": 4, "60代以上": 5 }
  enum live_prefecture: { "北海道": 0, "青森県": 1, "岩手県": 2, "宮城県": 3, "秋田県": 4, "山形県": 5, "福島県": 6, "茨城県": 7, "栃木県": 8, "群馬県": 9, "埼玉県": 10, "千葉県": 11, "東京都": 12, "神奈川県": 13, "新潟県": 14, "富山県": 15, "石川県": 16, "福井県": 17, "山梨県": 18, "長野県": 19, "岐阜県": 20, "静岡県": 21, "愛知県": 22, "三重県": 23, "滋賀県": 24, "京都府": 25, "大阪府": 26, "兵庫県": 27, "奈良県": 28, "和歌山県": 29, "鳥取県": 30, "島根県": 31, "岡山県": 32, "広島県": 33, "山口県": 34, "徳島県": 35, "香川県": 36, "愛媛県": 37, "高知県": 38, "福岡県": 39, "佐賀県": 40, "長崎県": 41, "熊本県": 42, "大分県": 43, "宮崎県": 44, "鹿児島県": 45, "沖縄県": 46 }
  enum tolerance: { "1 - 苦手": 0, "2 - どちらかというと苦手": 1, "3 - まあまあ": 2, "4 - どちらかというと得意": 3, "5 - 得意": 4 }
  
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
