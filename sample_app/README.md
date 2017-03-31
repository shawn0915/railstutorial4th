# Ruby on Rails Tutorial sample application
This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).
## License
All source code in the [Ruby on Rails Tutorial](http://railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Source
[sample_app_4th_ed](https://bitbucket.org/railstutorial/sample_app_4th_ed)

## Getting started
To get started with the app, clone the repo and then install the needed gems:
```ruby
$ bundle install --without production
```
Next, migrate the database:
```ruby
$ rails db:migrate
```
Finally, run the test suite to verify that everything is working correctly:
```ruby
$ rails test
```
If the test suite passes, you'll be ready to run the app in a local server:
```ruby
$ rails server
```
For more information, see the
[*Ruby on Rails Tutorial* book](http://www.railstutorial.org/book).


# Rails Command
生成控制器
```ruby
=> StaticPages
$ rails generate controller StaticPages home help
=> user
$ rails generate controller Users new
=> Session
$ rails generate controller Session new

```
撤销操作
```ruby
$ rails destroy controller StaticPages home help
```
生成模型
```ruby
$ rails generate model User name:string email:string
```


更新數據
```ruby
rails console
user = User.first
user.update_attributes(name: "Shawn Yan",
                                email: "shawn@shawnyan.com",
                                password: "123456",
                                password_confirmation: "123456")
                                
user.update_attributes(name: "Example User",
email: "example@railstutorial.org",
password: "foobar",
password_confirmation: "foobar")
```



# Git

切換分支
```
$ git checkout -b static-pages
$ git checkout master
```

合并分支
```
$ git merge static-pages
```

提交代碼
```
$ git push
```

# 身份驗證

##方案

[OpenID](https://en.wikipedia.org/wiki/OpenID)

[OAuth](https://en.wikipedia.org/wiki/OAuth)

# Guard
## 初始化
```ruby
$ bundle exec guard init
```

# 測試

## 鏈接測試
## 生成測試文件
```ruby
$ rails generate integration_test site_layout
```
## 集成測試
```ruby
$ rails test:integration
```
## 模型测试
```ruby
$ rails test:models
```
## 執行指定測試類
```ruby
$ rails test test/integration/users_login_test.rb
```



## Active Record
驗證數據、約束條件

## bcrypt 算法
[字典攻擊](https://en.wikipedia.org/wiki/Dictionary_attack)

[彩虹表攻擊](https://en.wikipedia.org/wiki/Rainbow_table)



# 數據庫

数据库迁移
```ruby
rails db:migrate
rails db:migrate RAILS_ENV=development
rails db:migrate RAILS_ENV=test
```
刪除數據庫文件
```ruby
cd db
rm -f development.sqlite3
```
创建索引
```ruby
$ rails generate migration add_index_to_users_email
```
add_column
```ruby
rails generate migration add_password_digest_to_users password_digest:string
```
增加remember_digest
```ruby
rails generate migration add_remember_digest_to_users remember_digest:string
```
添加測試數據
```ruby
rails console
User.create(name: "Michael Hartl", email: "mhartl@example.com", 
    password: "foobar", password_confirmation: "foobar")
```
添加admin
```ruby
$ rails generate migration add_admin_to_users admin:boolean
```
生成种子用户
```ruby
$ rails db:seed
```
添加user属性
```ruby
rails generate migration add_activation_to_users activation_digest:string activated:boolean activated_at:datetime
```


# gravatar

```
https://secure.gravatar.com/site/implement/images/
http://en.gravatar.com/
http://en.gravatar.com/site/implement/hash/
```
**img**

![img](https://s.gravatar.com/avatar/0f6dca05754c07690164183e3b9e50e0?s=80)

```
Email Address: shawn2016@aliyun.com
Email Hash: 0f6dca05754c07690164183e3b9e50e0
https://s.gravatar.com/avatar/0f6dca05754c07690164183e3b9e50e0?s=80
```

# token

SecureRandom.urlsafe_base64
=> "pDtKhXlRDnMArnambvsiTQ"

[会话劫持](http://codebutler.com/firesheep)

# 分页

[will_paginate](https://github.com/mislav/will_paginate/wiki)

# QA

**cannot load such file** 

ref:
http://stackoverflow.com/questions/41621029/cannot-load-such-file-bcrypt-ext


http://www.pixelstech.net/article/1488694151-Fix-issue-cannot-load-such-file----bcrypt_ext-%28LoadError%29


win-build
http://win-builds.org/doku.php/download_and_installation_from_windows
