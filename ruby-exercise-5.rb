#When doing this exercise, use methods when appropriate to keep things organized.
require 'set'
require 'pp'
snowy = File.read 'the-man-from-snowy-river.txt'
clancy = File.read 'clancy-of-the-overflow.txt'
words = File.read '/usr/share/dict/words'
snowy_words = snowy.split /\W+/
clancy_words = clancy.split /\W+/
#A set is a data structure that can have things added and removed, and you can ask if things are in it. You can make one from an array
# dictionary = Set.new File.read('/usr/share/dict/words').lines.map{|w| w.chomp}
dictionary = File.read('/usr/share/dict/words').lines.map{|w| w.chomp}
# words = dictionary.select{|word| word[0] != word[0].capitalize }
words = dictionary.select{|word| word[0] >= 'a' && word[0] <= 'z' }
@filtered_dictionary = Set.new words
puts @filtered_dictionary.length

#We can treat arrays as sets, and use + for union, - for difference
puts "Words in snowy but not clancy"
puts (snowy_words.map{|word| word.downcase} - clancy_words.map{|word| word.downcase}).uniq.join ', '

puts
puts "… and the reverse"
puts (clancy_words.map{|word| word.downcase} - snowy_words.map{|word| word.downcase}).uniq.join ', '

#The above are great, but note that we get both 'There' and 'there' separately (and others). Fix that.

puts
puts "The longest word in snowy is"

sorted_by_length = snowy_words.sort_by{|word| word.length}
puts sorted_by_length.last
#if sorted_by_length

puts "…"

#Here, find the words that are in Snowy but not in the dictionary
puts
puts "Names in Snowy are:"
snowy_names = snowy_words.select { |word| ! @filtered_dictionary.include? word.downcase }
puts snowy_names.join ', '
# puts (snowy_names - @filtered_dictionary).to_a.length
#Look up the documentation for Set to see how to test if a word is in it or not

puts
puts "Names in both Snowy and Clancy:"
clancy_names = clancy_words.select { |word| ! @filtered_dictionary.include? word.downcase }
names = snowy_names & clancy_names
puts names.join ', '

#Change this so it uses an array rather than a set. Marvel at how much slower it is.
#You can time how long something takes to run in bash by doing time before the command.
#So time ruby ruby-exercise-5.rb will tell you how long that took to run
