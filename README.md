# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| name               | string  | null: false |
| name_kana          | string  | null: false |
| birthday           | integer | null: false |

### Association

- has_many :items
- has_many :addresses
- has_many :purchases

## items テーブル

| Column       | Type       | Options                      |
| ------------ | ---------- | ---------------------------- |
| item_name    | string     | null: false                  |
| introduction | text       | null: false                  |
| category     | integer    | null: false                  |
| status       | integer    | null: false                  |
| claim        | integer    | null: false                  |
| delivery     | integer    | null: false                  |
| area         | integer    | null: false                  |
| date         | integer    | null: false                  |
| price        | integer    | null: false                  |
| user         | references | null:false, foreign_key:true |

### Association

- belongs_to :users
- belongs_to :addresses

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     | null: false                    |
| telephone    | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :purchases

## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| address      | references | null: false, foreign_key: true |

### Association

- belongs_to :addresses
- has_many   :users
