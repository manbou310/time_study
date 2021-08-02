# アプリケーション名
 Time Study app
# アプリケーション概要
前職の業務では作業時間の計測・集計に時間がかかっており、
これを解決するためのアプリ開発を開発した。


# URL
- https://time-sutudy-app.herokuapp.com/
# テスト用アカウント
- ユーザー①  
name :佐藤
email : aaa@gmail.com  
password : a12345  
- ユーザー②
name :鈴木
email : bbb@gmail.com  
password : b12345  
- 一般ユーザー③  
name :田中
email : ccc@gmail.com  
password : c12345


# 実装した機能
  - 実装機能
    - ユーザー管理機能  
      ![動画](https://user-images.githubusercontent.com/84434040/127807027-23e1959b-6b58-4ecc-bb44-ffbd0325829b.mp4)

    - チャンネル機能  
      情報を共有したいユーザーを選ぶ  
      ![動画](https://user-images.githubusercontent.com/84434040/127807094-640aaeb0-3767-46bd-ab01-3f003e272ffa.mp4)

    - 作業時間の実績投稿機能  
      ![動画](https://user-images.githubusercontent.com/84434040/127807147-85c08dd2-627a-4faf-a0c9-a63e79c4e614.mp4)  
      ![動画](https://user-images.githubusercontent.com/84434040/127807224-524060b8-9b75-4f37-af4b-1d2c432327ad.mp4)  

    - 実績投稿編集機能  
      投稿した内容の修正機能
      ![動画](https://user-images.githubusercontent.com/84434040/127807243-7bd5fcc2-59bf-4a1a-a2d0-9225d6e1ac19.mp4)

# 工夫したポイント
  - チャンネル機能実装により他の人にも情報を共有できる
  - 一覧表示画面で投稿したごとに色が変わるようにした
  - 入力フォームを追加できるようにした

# 実装予定の機能
  - CSVダウンロード機能
  - チャンネル複数登録
  - データ検索機能
  - レスポンシブデザイン 実装

# テーブル設計

## ER図
![データベース ER 図](https://user-images.githubusercontent.com/84434040/127803542-845737f4-76a9-4f7f-8db1-e4860943eefd.jpeg)




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
| start_time           | string     | null: false                    |
| ending_time          | string     | null: false                    |
| problem              | boolean    |                                |
| forgetting           | boolean    |                                |for




### Association
- belongs_to :works


# 開発環境
- フロントエンド：HTML5/CSS(Bootstrap)/JavaScript/jQuery/
- バックエンド：Ruby on Rails(6.0.0)/Ruby(2.6.5)/
- データベース：MySQL(5.6.50)/Sequel Pro
- インフラ：Heroku
- タスク管理：GitHub