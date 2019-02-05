# README

# Reprint

## 概要 

　廃盤になったDVDやゲームなどの商品を紹介して復刊をリクエストするサイト

## コンセプト 

　廃案になって見れないDVDやゲームなどを復刻して欲しい理由とともに紹介し、その魅力を共有するサイト。商品を見たり読んだりしたことがなくても見たいと思ったきっかけなどを投稿できる。商品の紹介だけでなく復刊リクエスト投票などができる。

## バージョン
  
  Ruby 2.5.3
  Rails 5.2.1

## 機能一覧 
  
|機能名|備考|
| --- | --- |
|ログイン機能|     |
|ユーザ登録機能|メールアドレス、名前、パスワードは必須|
|パスワード再設定機能|     |
|投稿一覧表示機能|　　 |
|検索機能|一覧ページでカテゴリーやジャンルなどで検索結果表示|
|画像投稿機能|ひとつの投稿で複数の投稿が可能|
|動画投稿機能|youtubeなどのurlを貼り付けて作品のイメージを伝える|
|投稿編集機能 |     |
|投稿削除機能 |編集と削除は投稿者のみできる|
|コメント機能|コメントはログイン時しかできない|
|復刻リクエスト投票機能|自分自身のリクエストには投票できない |

## カタログ設計
https://docs.google.com/spreadsheets/d/1pXkoSsRK7xn-YSA8cGIu6vBlBdhQgZRnHcQ7FeWL5I8/edit#gid=1177389026

## テーブル定義
https://docs.google.com/spreadsheets/d/1jfBgirMAVFvxxWxfDuqiBSrfJGOvnowLBwny_miHAA4/edit#gid=0

## 画面遷移図,画面ワイヤーフレーム
  
https://docs.google.com/spreadsheets/d/1T0IrpKJxE0ixAgeM4tPzJo0tDWkybFJ8NAKkEc8uG1w/edit#gid=883017537
## 使用Gem

 |Gem名|用途|
| --- | --- |
|carrierwave|画像アップロード|
|mini_magick|画像アップロード|
|devise|認証機能作成|
|ransack|検索機能|
|bootstrap|cssフレームワーク|
|toastr-rails|フラッシュメッセージ|
|jquery-rails|   |