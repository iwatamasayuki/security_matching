# README

## アプリケーション名

SECURTY MATCHNG

## アプリケーション概要

本アプリは、警備員を登録することによって、

他の警備員を必要とした企業を想定した人物と、

対話できるマッチングアプリケーションです。

## URL

https://security-matching.herokuapp.com/

## ユーザー認証

ID：alex

PASS：1111

## テスト用アカウント

Name: 登録用アカウント

Email: registration@registration.com

Password: regist1

***

Name: 閲覧用アカウント

Email: browsing@browsing.com

Password: brows2

## 利用方法

登録用アカウントでログインし、警備員の登録、編集及び削除が行えます。

その後、閲覧用アカウントでログインし直し、
警備員の閲覧、コメントが出来ます。

## 目指した課題解決

本来、警備員の新たな契約は会社単位で入札によって行われますが、

それをマッチングアプリで気軽に、
警備員1人ひとりを検索して対話することによって、

もっと自由に新たな繋がりができればと思って、
本アプリを制作しました。

## 洗い出した要件

- 警備員を登録できます。

- 登録するのは、所属会社、本人画像、警備員名、フリガナ、

  年齢、性別、経験年数、保有資格の８項目です。

- 登録したユーザーは、詳細ページにて編集及び削除が行えます。

- ログイン状態に関わらず、一覧と詳細ページの一部を閲覧できます。

- 一覧に表示されている各人は、紹介ページのリンクから詳細ページに遷移できます。

- ログインしているユーザーは、トップページにて検索及び、

  詳細ページのコメント欄にて会話ができます。

- 詳細ページでのコメントは、ログインしているユーザー全員が閲覧可能な為、

  他のユーザーが閲覧出来ない１対１で、チャットをすることができます。

## 実装した機能についてのGIFと説明

## 実装予定の機能

他のユーザーが閲覧出来ない１対１で、

チャットをすることができることは未実装なので、

今後の実装で追加していきたいです。

## データベース設計

## ローカルでの動作方法

1. ターミナルで保存したいディレクトリにて、以下を実行

```vb
git clone https://github.com/iwatamasayuki/security_matching.git
```

2. ターミナルでsecurity-matchingのディレクトリにて、以下を実行

```vb
rails s
```

3. ブラウザで以下にアクセス

```vb
http://localhost:3000/
```

ruby version  2.6.5

## usersテーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| name               | string     | nill:false               |
| email              | string     | nill:false,  unique:true | 
| encrypted_password | string     | nill:false               |

### Association
- has_many :guards
- has_many :tweets

## guardsテーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| company            | string     | nill:false               |
| guard_name         | string     | nill:false               |
| name_kana          | string     | nill:false               |
| gender             | string     | nill:false               |
| age                | integer    | nill:false               |
| experience         | integer    | nill:false               |
| qualification      | string     | nill:false               |


### Association
- belongs_to :user
- has_many :tweets

## tweetsテーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| text               | string     | nill:false               |

### Association
- belongs_to :user
- belongs_to :guards