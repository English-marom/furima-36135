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
* has_many :comments

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| product_name                           | string     | null: false       |
| description                            | string     | null: false       |
| category                               | string     | null: false       |
| state                                  | string     | null: false       |
| shipping charges                       | string     | null: false       |
| region                                 | string     | null: false       |
| days                                   | string     | null: false       |
### Association

- belongs_to :user
- has_many :comments

## address table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| postal_code                    | string     | null: false       |
| divisions                      | string     | null: false       |
| cities                         | string     | null: false       |
| address                        | string     | null: false       |
| building                       | string     | null: false       |
| phone                          | string     | null: false       |
### Association

- belongs_to :user
- belongs_to :user

### order
| who                                 | string     | null: false       |
| what                                | string     | null: false       |

### Association

- belongs_to :user
- belongs_to :user