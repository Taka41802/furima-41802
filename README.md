# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| last_name          | string   | null: false               |
| first_name         | string   | null: false               |
| last_name_ruby     | string   | null: false               |
| first_name_ruby    | string   | null: false               |
| date_of_birth      | date     | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| content          | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| burden_id        | integer    | null: false                    |
| area_id          | integer    | null: false                    |
| number_of_day_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false foreign_key: true  |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false foreign_key: true  |
| item          | references | null: false foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| area_id        | integer    | null: false                    |
| municipality   | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false foreign_key: true  |

### Association

- belongs_to :order