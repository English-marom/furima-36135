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

* has_many :items

## items table

| Column                                   | Type       | Options           |
|--------------------------------  --------|------------|-------------------|
| product_name                             | string     | null: false       |
| description                              | text       | null: false       |
| category_id                              | integer    | null: false       |
| state_id                                 | integer    | null: false       |
| shipping charges_id                      | integer    | null: false       |
| region_id                                | integer    | null: false       |
| days_id                                  | integer    | null: false       |
| user                                     | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## address table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| postal_code                    | string     | null: false       |
| region_id                      | string     | null: false       |
| cities                         | string     | null: false       |
| address                        | string     | null: false       |
| building                       | string     | null: false       |
| phone                          | string     | null: false       |
| order                          | references | null: false, foreign_key: true |

### Association

- belongs_to :order

### order
| user                                 | references     | null: false       |
| item                                | references     | null: false       |

### Association

- belongs_to :user
- belongs_to :item