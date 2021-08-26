# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false ,unique: true|
| encrypted_password | string              | null: false             |
| name               | string              | null: false             |
| birth date         |strings              | null: false             |

### Association

* has_many :prototypes
* has_many :comments

## 商品情報 table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| exhibitor                           | string     | null: false       |
| category                            | string     | null: false       |
| state                               | string n   | null: false       |
| shipping                            | string     | null: false       |
| area                                | string     | null: false       |


### Association

- belongs_to :user
- has_many :comments

## 商品発送情報 table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| postal code                    | string     | null: false       |
| divisions                      | string     | null: false       |
| cities                         | string     | null: false       |
| address                        | string     | null: false       |
| building                       | string     | null: false       |
| phone                          | string     | null: false       |
### Association

- belongs_to :prototype
- belongs_to :user

### 購入記録
| who                                 | string     | null: false       |
| what                                | string     | null: false       |

### Association

- belongs_to :prototype
- belongs_to :user