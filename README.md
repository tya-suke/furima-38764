## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| full name          | string | null: false |
| email              | string | null: false |
| password 　　　　　　| integer | null: false |
| nick name          | string | null: false |

### Association
- has_many : items_users
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
| building name | string      ｜ null: false                    |
| prefecture    | string      ｜ null: false                    |
| phon number   | string      ｜ null: false                    |
| user id       | references  |  null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user


## card テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| user id     | references | null: false, foreign_key: true |                              |
| customer id | references | null: false, foreign_key: true |

### Association
- belongs_to : customer
- belongs_to : user