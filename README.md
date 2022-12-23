## users テーブル

| Column             | Type    | Options                 |
| ------------------ | ------  | ------------------------|
| family_name        | string  | null: false             |
| first_name         | string  | null: false             |
| family_name_kana   | string  | null: false             |
| first_name_kana    | string  | null: false             |
| email              | string  | null: false,unique: true|
| encrypted_password | integer | null: false             |
| nick name          | string  | null: false             |
| birth_day          | date    | null: false             |

### Association
- has_many : items
- has_many : customers
- belongs_to : card


## items テーブル

| Column    | Type    | Options     |
| ------    | ------  | ----------- |
| product   | string  | null: false |
| Category_id｜integer | null: false, foreign_key: true |
| price     | integer | null: false |
| image     | string  | null: false |

### Association
- belongs_to : user 



## customer テーブル

| Column          | Type       | Options                        |
| ----------------| ---------- | ------------------------------ |
| family_name     | string     ｜ null: false                   |
| first_name      | string     | null: false                    |
| post_code       | string     | null: false                    |
| city            | string     ｜ null: false                    |
| address         | string     ｜ null: false 　　　　　　　　　　  |
| building name   | string     ｜                                |
| prefecture      | string     ｜ null: false                    |
| phon_number     | string     ｜ null: false                    |
| user_id         | references |  null: false                    |

### Association
- belongs_to :user
- belongs_to :card



## card テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |                              |
| product     | references | null: false, foreign_key: true |

### Association
- has_one : customer
-