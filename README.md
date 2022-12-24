## users テーブル

| Column             | Type    | Options                 |
| ------------------ | ------  | ------------------------|
| family_name        | string  | null: false             |
| first_name         | string  | null: false             |
| family_name_kana   | string  | null: false             |
| first_name_kana    | string  | null: false             |
| email              | string  | null: false,unique: true|
| encrypted_password | string  | null: false             |
| nick_name          | string  | null: false             |
| birth_day          | date    | null: false             |

### Association
- has_many :items
- has_many :cards



## items テーブル

| Column              | Type    | Options     |
| --------------------| ------  | ----------- |
| product             | string  | null: false |
| info                | text    | null: false |
| price               | integer | null: false |
| condition_id        | integer | null: false |
| postage_type_id     | integer | null: false |
|shipping_charge_id   | integer | null: false |
|ship_from_address_id | integer | null: false |
|days_to_ship_id      | integer | null: false |
| user                |references|null: false |
| card                |references|null: false |
| prefecture_id       | string  | null: false |

### Association
- belongs_to : user 
- has_one : customer
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage_type
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :days_to_Ship  



## customers テーブル

| Column          | Type       | Options                        |
| ----------------| ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| city            | string     ｜ null: false                    |
| address     　   | references | null: false, foreign_key: true |    
| building_name   | string     ｜                                |
| prefecture      | string     ｜ null: false                    |
| phon_number     | string     ｜ null: false                    |
| card          　| references | null: false ,foreign_key: true  |                   |

### Association
- has_one :card




## card テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| users        | reference | null: false, foreign_key: true |                              |
| items       | reference | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
- has_one  :customer