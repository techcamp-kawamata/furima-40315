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
belomgs_to: user
has_one: purchase


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

|Column       |Type|Options|
|-------------|----|-------|
|post_code    |integer     |
|prefecture   |string      |
|municipality |string      |
|house_number |string      |
|building_name|string      |
|phone_number |integer     |

### Association
belomgs_to: purchase