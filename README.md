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
      (https://gyazo.com/188a0303956d30da7660988ea4689040)

    - チャンネル機能
      情報を共有したいユーザーを選ぶ
      https://gyazo.com/7fac985aecf12845736628a8b61ac8a3

    - 作業時間の実績投稿機能
      (https://gyazo.com/3f80836ce1a0566f3b553d87603c59c0)
      (https://gyazo.com/38fa700db0a1e5f929fb5f2bde514cfb)

    - 実績投稿編集機能
      投稿した内容を修正できる
      (https://gyazo.com/9b5567f39766049b0f91351a1ded163e)
      
    - 検索結果〜グラフ表示〜コメント機能
      ![マーケット情報検索結果~グラフ~コメント](https://user-images.githubusercontent.com/74547623/104898858-7ade1d80-59bd-11eb-8709-00dc1311ddd3.gif)

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
