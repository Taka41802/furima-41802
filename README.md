# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| category    | string     | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false foreign_key: true  |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| address   | string     | null: false                    |
| user      | references | null: false foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user