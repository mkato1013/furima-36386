# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options                      |
| ------------ | ---------- | ---------------------------- |
| item_name    | string     | null: false                  |
| introduction | text       | null: false                  |
| category_id  | integer    | null: false                  |
| status_id    | integer    | null: false                  |
| claim_id     | integer    | null: false                  |
| area_id      | integer    | null: false                  |
| date_id      | integer    | null: false                  |
| price        | integer    | null: false                  |
| user         | references | null:false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :purchase

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| telephone     | string     | null: false                    |

### Association

- belongs_to :purchase

## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
| address      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address
