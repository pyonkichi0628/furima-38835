class Product < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  #アソシエーション
  belongs_to :user 
  has_one :item

  #アクティブストレージとのアソシエーション
  has_one_attached :image

  #アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_day

  #バリデート
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    #マイグレーションファイルでは省略されているが、実際は_idがついている references型の書き方
  end

  #「---」の場合
  with_options numericality: {other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_day_id
  end
end
