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
- has_many :destinations dependent: :destroy
====================================================================

##  destinations テーブル（発送先情報（住所））
===================================================================
| Column             | Type       | Options                       | 
| ------------------ | ---------- | ----------------------------- | 
| post_code          | string     | null: false                   |
| prefecture_id      | integer    | null: false                   |
| city               | string     | null: false, foreign_key: true|
| address            | string     | null: false, foreign_key: true|
| building           | string     | foreign_key: true             |
| phone_number       | string     | null: false, foreign_key: true|
### Association
- has_many :items 
====================================================================



## products テーブル（商品情報）
===================================================================
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| status             | string     | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_id        | integer    | null: false, foreign_key: true |
| user               | reference  | null: false, foreign_key: true |
### Association
- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- belongs_to_active_hash :prefecture
====================================================================

## items テーブル（購入情報）
===================================================================
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | string     | null: false                    |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
### Association
belongs_to destination dependent: :destroy
====================================================================