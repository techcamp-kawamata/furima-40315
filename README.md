# README

## Usersテーブル

|Column    |Type     |Options     |
|----------|---------|------------|
|nickname  |string   |null: false |
|email     |string   |null: false |
|password  |string   |null: false |
|last_name |string   |null: false |
|first_name|string   |null: false |
|birthday  |string   |null: false |

### Association
has_many :items
has_many :purchasers


## Itemsテーブル

|Column        |Type    |Options     |
|--------------|--------|------------|
|item_name     |string  |null: false |
|text          |text    |null: false |
|category      |string  |null: false |
|condition     |string  |null: false |
|postage       |string  |null: false |
|region        |string  |null: false |
|delivery_time |string  |null: false |
|price         |integer |null: false |

※imageはActiveStrageで実装するため含まない

### Association
belongs_to: user
has_one: purchaser


## Purchasersテーブル

|Column  |Type       |Options                        |
|--------|-----------|-------------------------------|
|user_id |references |null: false, foreign_key: true |
|item_id |references |null: false, foreign_key: true |

### Association
belongs_to: user
belongs_to: item
has_one: address


## Addressesテーブル

|Column        |Type----|Options     |
|--------------|--------|------------|
|post_code     |integer |null: false |
|prefecture    |string  |null: false |
|municipality  |string  |null: false |
|house_number  |string  |null: false |
|building_name |string  |            |
|phone_number  |integer |null: false |

### Association
belongs_to: purchaser