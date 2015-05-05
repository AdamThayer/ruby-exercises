#A variable starting with @ is a property, visible inside everywhere in this file
@favorite_books = {
  'Frank Herbert'   => ['Dune', 'Dune Messiah', 'Children of Dune', 'God Emperor of Dune'],
  'Isaac Asimov'    => ['Foundation', 'Foundation and Empire', 'Second Foundation'],
  'Mervyn Peake'    => ['Titus Groan', 'Gormenghast'],
  'William Goldman' => ['The Princess Bride']
}

def get_books author
  books = @favorite_books[author]
  if books == nil
    puts "No such author"
  else
    puts books.join ', '
  end
end

#TODO finish me
def count_books author
  books = @favorite_books[author]

  if books == nil
    puts "No books by this author"
  else
    puts books.count
end
end

#TODO Finish this
def find book
  result = nil
  @favorite_books.each do |author, books|
    puts author if books.include? book
  end
  if result
    puts result
  else
    puts "No such book"
  end
end

def handle_command command, arg
  if command == 'get'
    get_books arg
  elsif command == 'count'
    count_books arg
  #TODO Add find command
  else
    puts "Command not recognized"
  end
end

loop do
  print "Enter a command (q to finish): "

  entered = gets.chomp #chomp removes the \n from the end

  exit if entered == 'q'

  parts = entered.split ' ', 2 #Split into two parts
  handle_command parts[0], parts[1]
end
