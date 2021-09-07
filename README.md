# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false ,unique: true|
| encrypted_password | string              | null: false             |
| name               | string              | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| kana_last name     | string              | null: false             |
| kana_first name    | string              | null: false             |
| birth_date         | date                | null: false             |

### Association

- has_many :items
- has_many :orders

## items table

| Column                                   | Type       | Options           |
|--------------------------------  --------|------------|-------------------|
| product_name                             | string     | null: false       |
| description                              | text       | null: false       |
| category_id                              | integer    | null: false       |
| state_id                                 | integer    | null: false       |
| shipping_charge_id                       | integer    | null: false       |
| region_id                                | integer    | null: false       |
| scheduled_day_id                         | integer    | null: false       |
| amount_id                                | integer    | null: false       |
| user                                     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## addresses table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| postal_code                    | string     | null: false       |
| region_id                      | string     | null: false       |
| cities                         | string     | null: false       |
| address                        | string     | null: false       |
| phone                          | string     | null: false       |
| order                          | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to :order

### orders table
| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user                                 | references     | null: false       |
| item                                 | references     | null: false       |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address