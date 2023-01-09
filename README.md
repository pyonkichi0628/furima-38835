# テーブル設計

## users テーブル

| Column             | Type   | Options                  | 
| ------------------ | ------ | ------------------------ |
| name               | string | null: false              |
| email              | string | null: false              |
| password           | string | null: false              |
| encrypted_password | string | null: false              |
| user_image         | string |                          |
| introduction       | text   |                          |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_day          | date   | null: false              |



### Association

- has_many :prototypes
- has_many :comments


## prototypes テーブル

| Column             | Type       | Options                       | 
| ------------------ | ---------- | ----------------------------- | 
| title              | string     | null: false                   |
| catch_copy         | text       | null: false                   |
| concept            | text       | null: false                   |
| user               | references | null: false foreign_key: true |

### Association

- belongs_to :users
- has_many :comment


## comments テーブル

| Column             | Type       | Options                      |  
| ------------------ | ---------- | ---------------------------- |
| content            | text       | null: false                  |
| prototype          | references | null: false foreign_key: true|
| user               | references | null: false foreign_key: true|  

### Association

- belongs_to :user
- belongs_to :prototype
