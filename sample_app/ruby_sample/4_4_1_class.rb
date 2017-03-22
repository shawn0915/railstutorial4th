puts "=== range ==="
p (1..10).class
p (1..10).class.superclass
p (1..10).class.superclass.superclass
p (1..10).class.superclass.superclass.superclass

puts "=== hash ==="
user = {:name => "shawn", :email => "shawn@shawnyan.com"}
p user.class
p user.class.superclass

puts "=== symbol ==="
p :name.class
p :name.class.superclass