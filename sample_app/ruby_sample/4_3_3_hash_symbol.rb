# hash
user = {:name => "shawn", :email => "shawn@shawnyan.com"}
p user
p user[:name] # => puts user[:name].inspect
p user[:email]

# 嵌套散列
params = {}
params[:user] = {:name => "shawn", :email => "shawn@shawnyan.com"}
p params
p params[:user][:email]
params.each do |key, value|
  puts "Key #{key.inspect} has value #{value.inspect}"
end
params[:user].each do |key, value|
  puts "Key #{key.inspect} has value #{value.inspect}"
end

puts "=== merge ==="
p h = {"a" => 100, "b" => 200}.merge({"b" => 400})
p h["a"]
p h["b"]