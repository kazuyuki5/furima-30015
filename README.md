## users テーブル

| Column            | Type     | Options     |
| ----------------- | -------- | ----------- |
| nickname          | string   | null: false |
| email             | string   | null: false |
| password          | string   | null: false |
| kanji_family_name | string   | null: false |
| kanji_first_name  | string   | null: false |
| kana_family_name  | string   | null: false |
| kana_first_name   | string   | null: false |
| birthday          | date     | null: false |

### Association

- has_many :items
- has_many  :orders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| explanation     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| delivery_day_id | integer    | null: false                    | 
| price           | integer    | null: false                    |


### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - belongs_to :item
 - has_one    :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| area_id       | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |


### Association

- belongs_to order