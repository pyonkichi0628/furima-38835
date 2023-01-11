# テーブル設計

## users テーブル（ユーザー情報）
====================================================================
| Column             | Type   | Options                           | 
| ------------------ | ------ | --------------------------------- |
| name               | string | null: false                       |
| email              | string | null: false, unique: true         |
| encrypted_password | string | null: false                       |
| family_name        | string | null: false                       |
| first_name         | string | null: false                       |
| family_name_kana   | string | null: false                       |
| first_name_kana    | string | null: false                       |
| birth_day          | date   | null: false                       |
### Association
- has_many :products dependent: :destroy
- has_many :items dependent: :destroy
====================================================================

##  destinations テーブル（発送先情報（住所））
===================================================================
| Column             | Type       | Options                       | 
| ------------------ | ---------- | ----------------------------- | 
| post_code          | string     | null: false                   |
| prefecture_id      | integer    | null: false                   |
| city               | string     | null: false                   |
| address            | string     | null: false                   |
| building           | string     |                               |
| phone_number       | string     | null: false                   |
| item_purchase      | integer    | null: false, foreign_key: true|
### Association
- has_one :item
====================================================================


## products テーブル（商品情報）
===================================================================
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| photo              | text       | null: false                    |
| name               | string     | null: false                    |
| explanation        | text       |                                |
| category_id        | reference  | null: false, foreign_key: true |
| condition_id       | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | reference  | null: false, foreign_key: true |
### Association
- belongs_to :user dependent: :destroy
====================================================================

## items テーブル（購入情報）
===================================================================
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product            | integer    | null: false, foreign_key: true |
| user               | integer    | null: false, foreign_key: true |
| purchase_info      | integer    | null: false, foreign_key: true |
### Association
- belongs_to :product
- belongs_to :user
====================================================================