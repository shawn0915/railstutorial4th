require './4_4_5_example_user'

example = User.new
p example.name
p example.name = 'shawn'

p example.email
p example.email = 'shawn@shawnyan.com'

p example.format_email