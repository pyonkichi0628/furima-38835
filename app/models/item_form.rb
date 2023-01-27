class ItemForm
  include ActiveModel::Model
  #購入時に保存したい複数のテーブル(発送先住所、購入情報 )
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone_number, :item, :product_id, :user_id, :token

  #バリデーション
  with_options presence: true do
    #郵便番号
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    #都道府県                   数字でなくてはならない{ただし0は除外}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank"}
    #市区町村
    validates :city
    #番地
    validates :address
    #電話番号
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid'}
    #購入外部キー
    validates :product_id
    validates :user_id
    #ここでitemを書かないのは下の処理でitemを作り実際にカラムに値を入れているからこの段階ではitemは値がない
    #トークン
    #validates :token
  end
  #建物名
  validate :building

  def save
    #各テーブルにデータを保存する処理
    #購入テーブル         カラム名: 実際に保存したい値(attr_accessorの記述のもの)
     item = Item.create(product_id: product_id, user_id: user_id)
    #発送先住所 こちらは変数化しなくていい   itemは上記で定義した変数を使用
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, item_id: item.id)
   end
end