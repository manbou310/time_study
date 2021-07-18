# README
# テーブル設計

## users テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| image  

### Association
- has_many :channel_users
- has_many :channels, through: :channel_users
- has_many :works



## channels テーブル
| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| channel_name   | string | null: false |

### Association
- has_many :channel_users
- has_many :users, through: :channel_users
- has_many :works




## channel_users テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| channel   | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user




## works テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| date         | string     | null: false                    |
| process_name | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| channel      | references | null: false, foreign_key: true |

### Association
- belongs_to :channel
- belongs_to :user
- has_many :time_studies





## time_studies テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| production_name      | string     |                                |
| serial_number        | string     |                                |
| start_time           | integer    | null: false                    |
| ending_time          | integer    | null: false                    |
| problem              | boolean    |                                |
| forgetting           | boolean    |                                |for




### Association
- belongs_to :works
