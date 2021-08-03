# アプリケーション名
 Time Study app
# アプリケーション概要
前職の業務では作業時間の計測・集計に時間がかかっていました。  
これを解決するためのアプリを開発しました。


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
      ![ログイン](https://user-images.githubusercontent.com/84434040/127809042-107a3414-a9ce-4512-80d9-0f805b0e5653.gif)

    - チャンネル機能  
      情報を共有したいユーザーを選ぶ  
      ![チャンネル作成](https://user-images.githubusercontent.com/84434040/127809867-59171b14-ba7a-4a51-b909-034b001d1517.gif)

    - 作業時間の実績投稿機能  
      ![フォーム追加](https://user-images.githubusercontent.com/84434040/127809881-089bf9d1-1b09-435a-8be6-d511447807ce.gif)  
      ![新規投稿](https://user-images.githubusercontent.com/84434040/127809933-436ea451-fdac-407a-8b2c-a6b695904741.gif)  

    - 実績投稿編集機能  
      投稿した内容の修正機能
      ![編集機能](https://user-images.githubusercontent.com/84434040/127809953-eb341c2c-46ad-4cf2-8051-01ee91cae3a5.gif)

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