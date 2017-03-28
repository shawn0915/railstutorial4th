# toy_app

```ruby
$ rails generate scaffold User name:string email:string
```
注意!

没必要指定id 字段，Rails 会自动创建并将其设为表的主键（primary key）。


**migrate**

迁移（migrate）数据库
使用新的User 数据模型更新数据库

```ruby
$ rails db:migrate
```

**Microposts**

使用rails generate scaffold 命令生成Microposts 资源的代码

```ruby
$ rails generate scaffold Micropost content:text user_id:integer
```