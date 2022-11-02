# unifa_task
### バージョン
- ruby  3.1.2
- rails 7.0.4


### 動作確認のフロー
```
bundle install
```
```
rails db:create
```
```
rails active_storage:install
```
```
rails db:migrate
```
##### ユーザー作成
```
rails c

コンソールにて以下実行
User.create(user_id: 'user_id',password: 'Password123!',password_confirmation: 'Password123!')
```

##### .envファイル作成
```
touch .env

.envファイルを開いて以下を記載
TWEET_APP_CLIENT_ID="メールで共有頂いたclient_id"
TWEET_APP_CLIENT_SECRET="メールで共有頂いたclient_secret"
```

```
rails s
```

##### 下記URLにアクセスしログイン画面が表示されたら、事前に作成したユーザーのID,PASSWORDを入力
```
localhost:3000
```
