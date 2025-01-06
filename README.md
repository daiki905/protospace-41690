■userテーブル
・email 
string ,notnull ,ユニーク成約
・encrypted_password 
string ,notnull
・name
string ,notnull
・profile
text ,notnull
・occupation
text ,not null
・position
text ,notnull

■commentsテーブル
・content
text ,notnull
・prototype
references ,notnull ,外部キー
・user
references ,notnull ,外部キー

■prototypesテーブル
・title
string ,notnull
・catch_copy
text ,notnull
・consept
text ,notnull
・user
references ,notnull ,外部キー
