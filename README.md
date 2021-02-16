# README

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
| content            | string     | nill:false               |

### Association
- belongs_to :user
- belongs_to :guards