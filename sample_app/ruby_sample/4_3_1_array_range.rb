# puts s = "It's a palindrome!" if s == s.reverse

def string_message(str = '')
  if str.empty?
    "It's an empty string!"
  else
    "The string is nonempty."
  end
end

puts string_message("")

puts "=== string_msg ==="

def string_msg(the_function_argument = '')
  if the_function_argument.empty?
    "It's an empty string!"
  else
    "The string is nonempty."
  end
end

puts string_msg("")
puts string_msg("string")


# 測試回文
puts "=== palindrome ==="

def palindrome_tester(s)
  if s == s.reverse
    puts "It's a palindrome!"
  else
    puts "It's not a palindrome."
  end
end


# split
puts "=== split ==="
a = "A man, a plan, a canal, Panama".split(',')
p a
s = a.join
p s
p b = s.split(' ').join.downcase
palindrome_tester(b)

# range
puts "=== range ==="
p a = ('a'..'z').to_a
p a[6]
p b = a.reverse
p b[6]