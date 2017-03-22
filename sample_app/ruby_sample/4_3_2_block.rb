puts "=== shuffle ==="
p ('a'..'z').to_a.shuffle[0..7].join


puts "=== map ==="
p (0..16).to_a.each.map { |i| i ** 2 }


puts "=== yeller ==="

def yeller(arg)
  arg.each.map { |i| i.upcase }.join
end

p yeller(['o', 'l', 'd'])


puts "=== string_shuffle ==="

def string_shuffle(s)
  p s.split('').shuffle.join
end

string_shuffle("foobar")