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
- has_one  :order

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_fee    | string     | null: false                    |
| area            | string     | null: false                    |
| delivery_day    | string     | null: false                    | 
| price           | string     | null: false                    |
| condition       | string     | null: false                    |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |
| card_number         | string     | null: false                    |
| expdate             | datetime   | null: false                    |
| security_code       | string     | null: false                    |

### Association
 - belongs_to :user
 - belongs_to :item
 - has_one    :addresses

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| order        | references | null: false, foreign_key: true |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |


### Association

- belongs_to order