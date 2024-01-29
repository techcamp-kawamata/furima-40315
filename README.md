# README

## Usersテーブル

|Column             |Type   |Options                   |
|-------------------|-------|--------------------------|
|nickname           |string |null: false               |
|email              |string |null: false, unique: true |
|encrypted_password |string |null: false               |
|last_name          |string |null: false               |
|first_name         |string |null: false               |
|last_name_kana     |string |null: false               |
|first_name_kana    |string |null: false               |
|birthday           |date   |null: false               |

### Association
has_many :items
has_many :purchases


## Itemsテーブル

|Column           |Type    |Options     |
|-----------------|--------|------------|
|item_name        |string  |null: false |
|detail           |text    |null: false |
|category_id      |integer |null: false |
|condition_id     |integer |null: false |
|postage_id       |integer |null: false |
|region_id        |integer |null: false |
|delivery_time_id |integer |null: false |
|price            |integer |null: false |

※imageはActiveStrageで実装するため含まない

### Association
belongs_to: user
has_one: purchase


## Purchasesテーブル

|Column  |Type       |Options                        |
|--------|-----------|-------------------------------|
|user    |references |null: false, foreign_key: true |
|item    |references |null: false, foreign_key: true |

### Association
belongs_to: user
belongs_to: item
has_one: address


## Addressesテーブル

|Column        |Type       |Options                        |
|--------------|-----------|-------------------------------|
|post_code     |string     |null: false                    |
|region_id     |integer    |null: false                    |
|municipality  |string     |null: false                    |
|house_number  |string     |null: false                    |
|building_name |string     |                               |
|phone_number  |string     |null: false                    |
|purchase_id   |references |null: false, foreign_key: true |


### Association
belongs_to: purchase