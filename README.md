# README

#テーブル設計

## users テーブル

| Column           | Type   | Options  |
| ---------------- | ------ | ---------|
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | string | null: false |

### Association

- has_many :items
- has_many  :orders

## items テーブル

| Column                              | Type       | Options                     |
| ----------------------------------- | ---------- | --------------------------- |
| product                             | string     | null: false                 |
| description                         | text       | null: false                 |
| price                               | string     | null: false                 |                   
| scheduled_delivery_id(acitve_hash)  | integer    | null: false                 |
| shipping_fee_status_id(acitve_hash) | integer    | null: false                 |
| prefecture_id(acitve_hash)          | integer    | null: false                 |
| sales_status_id(acitve_hash)        | integer    | null: false                 |
| category_id(acitve_hash)            | integer    | null: false                 |
| user_id                             | references | NOT NULL, foreign_key: true |

### Association

- has_one    :order
- belongs_to :user

## orders テーブル

| Column     | Type       | Options                     |
| ---------- | ---------- | --------------------------- |
| user_id    | references | NOT NULL, foreign_key: true |
| item_id    | references | NOT NULL, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one  :address

## addresses テーブル

| Column                     | Type    | Options     |
| -------------------------- | ------  | ----------- |
| postal_code                | string  | null: false |
| prefecture_id(acitve_hash) | integer | null: false |
| city                       | string  | null: false |
| address                    | string  | null: false |
| building                   | string  |             |
| phone                      | string  | null: false |

### Association

- belongs_to :user


