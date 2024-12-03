# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| fullname           | string   | null: false               |
| date_of_birth      | integer  | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| content        | text       | null: false                    |
| category       | string     | null: false                    |
| condition      | string     | null: false                    |
| burden         | string     | null: false                    |
| area           | string     | null: false                    |
| number_of_days | string     | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false foreign_key: true  |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| address       | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user          | references | null: false foreign_key: true  |
| item          | references | null: false foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| prefectures    | string     | null: false                    |
| municipality   | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     |                                |
| purchase       | references | null: false foreign_key: true  |

### Association

- belongs_to :purchase