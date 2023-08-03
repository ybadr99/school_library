class List
  def books
    list = FileIO.load_file('./data/books.json')
    puts 'No books' if list.empty?
    list.each_with_index do |book, index|
      puts "book number: #{index + 1}, Title: \"#{book['title']}\", Author: #{book['author']}"
    end
  end

  def people
    list = FileIO.load_file('./data/people.json')
    puts 'No people' if list.empty?
    list.each_with_index do |person, index|
      puts "[#{person['type']}] person number: #{index + 1}, Name: \"#{person['name']}\", ID: #{person['id']}, Age: #{person['age']}"
    end
  end

  def rentals
    list = FileIO.load_file('./data/rentals.json')
    print 'ID of person: '
    person_id = gets.chomp.to_i
    matching_hash = list.find { |hash| hash['person']['id'] == person_id }
    puts 'Rentals:'
    puts matching_hash ? "Date: #{matching_hash['date']}, Book Title: #{matching_hash['book']['title']}, Author: #{matching_hash['book']['author']}" : "ID doesn't exisit"
    puts 'Press Enter to continue!'
  end
end
