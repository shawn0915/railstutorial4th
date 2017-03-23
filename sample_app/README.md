# Ruby on Rails Tutorial sample application
This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).
## License
All source code in the [Ruby on Rails Tutorial](http://railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.
## Getting started
To get started with the app, clone the repo and then install the needed gems:
```
$ bundle install --without production
```
Next, migrate the database:
```
$ rails db:migrate
```
Finally, run the test suite to verify that everything is working correctly:
```
$ rails test
```
If the test suite passes, you'll be ready to run the app in a local server:
```
$ rails server
```
For more information, see the
[*Ruby on Rails Tutorial* book](http://www.railstutorial.org/book).


# Static Pages
切换分支
```
$ git checkout -b static-pages
```

生成控制器
```
$ rails generate controller StaticPages home help
```

撤销操作
```
$ rails destroy controller StaticPages home help
```

# git

## 合并分支
```
$ git checkout master
$ git merge static-pages
$ git push
```

# Guard
## 初始化
```
$ bundle exec guard init
```

# 測試

## 鏈接測試
生成測試文件
```
$ rails generate integration_test site_layout
```
## 集成測試
```
$ rails test:integration
```
## 模型测试
```
$ rails test:models
```


# User

生成控制器
```
$ rails generate controller Users new
```
生成模型
```
$ rails generate model User name:string email:string
```

创建索引
```
$ rails generate migration add_index_to_users_email
```
数据库迁移
```
$ rails db:migrate RAILS_ENV=test
```