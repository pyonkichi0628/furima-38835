class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション　userテーブルに関連するもの
  validates :name,               presence: true
  validates_format_of :password, { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数字を使用してください' }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナを使用してください' } do
    validates :family_name_kana
    validates :first_name_kana
  end
  validates :birth_day, presence: true

  # アソシエーション
  has_many :products, dependent: :destroy
  has_many :items, dependent: :destroy
end
