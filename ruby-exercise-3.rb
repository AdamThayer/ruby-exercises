#The exercise is to make the last exercise answer clearer, shorter and simpler using methods
def to_words s
  s.split /\W+/
end

def starts_with_vowel s
  #FIXME Errors on an empty string
  #w{a e i o u} is a quick way of writing ['a', 'e', 'i', 'o', 'u']
  %w{a e i o u}.include? s[0].downcase #Can you see why we use downcase here?
end

def odd_num_word line
  line.split.count % 2 == 1
end


def last_word line
  line.split(/\W+/).last
end

snowy = File.read 'the-man-from-snowy-river.txt'

snowy_lines = snowy.lines
snowy_words = to_words snowy

#Example
puts "Here are the lines of Snowy that start with a vowel"

snowy_lines.each do |line|
  puts line if starts_with_vowel line
end

puts
puts "Here are the lines of Snowy that have an odd number of words"
#hint: a % b is the remainder after you divide a by b (called "mod" or "modulus")
# for example 17 % 2 == 1
snowy_lines.each do |line|
puts line if odd_num_word line
end

puts
puts "Here are all the rhyming pairs from the ends of the Snowy lines"
i = 0
while i < snowy_lines.count
  [0, 1, 4, 5].each do |n|
    first_word = last_word snowy_lines[i + n]
    second_word = last_word snowy_lines[i + n + 2]

    puts "#{first_word}, #{second_word}"
  end
  i += 9 # This is a short way of writing i = i + 9
end
