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
| birth_day          | datetime| null: false

### Association
- has_many : items
- has_many : customer 
- belongs_to : card


## items テーブル

| Column   | Type   | Options     |
| ------   | ------ | ----------- |
| product  | string | null: false |
| Category ｜string | null: false |
| price    | string | null: false |
| image    | string | null: false |

### Association
- belongs_to : user 
- belongs_to : customer


## customer テーブル

| Column        | Type        | Options                        |
| ------        | ----------  | ------------------------------ |
| full name     | string      ｜ null: false                   |
| post code     | string      | null: false                    |
| city          | string      ｜ null: false                    |
| address       | string      ｜ null: false 　　　　　　　　　　  |
| building name | string      ｜                    |
| prefecture    | string      ｜ null: false                    |
| phon number   | string      ｜ null: false                    |
| user id       | references  |  null: false, foreign_key: true |

### Association
- has_many: items
- belongs_to :user


## card テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |                              |
| product     | references | null: false, foreign_key: true |

### Association
- has_one : customer
-