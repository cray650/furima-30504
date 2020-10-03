# README

#テーブル設計

## users テーブル

| Column           | Type   | Options  |
| ---------------- | ------ | ---------|
| nickname         | string | NOT NULL |
| email            | string | NOT NULL |
| password         | string | NOT NULL |
| family_name      | string | NOT NULL |
| first_name       | string | NOT NULL |
| family_name_kana | string | NOT NULL |
| first_name_kana  | string | NOT NULL |

### Association

- has_many :items
- has_one  :orders
- has_one  :addresses


## items テーブル

| Column      | Type       | Options                     |
| ----------  | ---------- | --------------------------- |
| product     | string     | NOT NULL                    |
| description | text       | NOT NULL                    |
| price       | string     | NOT NULL                    |
| user_id     | references | NOT NULL, foreign_key: true |

### Association

- has_one    :orders
- belongs_to :users

## orders テーブル

| Column     | Type       | Options                     |
| ---------- | ---------- | --------------------------- |
| user_id    | references | NOT NULL, foreign_key: true |
| item_id    | references | NOT NULL, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## addresses テーブル

| Column      | Type    | Options  |
| ----------  | ------  | -------- |
| postal_code | string  | NOT NULL |
| city        | string  | NOT NULL |
| address     | string  | NOT NULL |
| building    | string  | NOT NULL |
| phone       | string  | NOT NULL |

### Association

- belongs_to :users


