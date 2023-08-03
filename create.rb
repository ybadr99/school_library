require_relative 'teacher'
require_relative 'student'
require_relative 'person'
require_relative 'lists'
require_relative 'rental'
require_relative 'file_io'

require 'json'

class Create
  def initialize
    @list = List.new
  end

  def people(choice, name, age, people_list)
    if choice == '1'
      person = create_a_student(name, age)
      person.type = 'Student'
    elsif choice == '2'
      person = create_a_teacher(name, age)
      person.type = 'Teacher'
    else
      puts 'Uncorrect inputs!'
    end
    people_list.push(person)
    FileIO.save_to_file('./data/people.json', people_list)
    puts 'created successfully'
    puts 'Press Enter to continue!'
  end

  def create_a_student(name, age)
    print 'Parent permission? [Y/N]: '
    parent_decision = gets.chomp
    print 'Class :'
    label = gets.chomp
    parent_permission = true if %w[Y y].include?(parent_decision)
    parent_permission = false if %w[N n].include?(parent_decision)
    id = 77
    classroom = Classroom.new(label)
    Student.new(classroom, age, name, id: id, parent_permission: parent_permission)
  end

  def create_a_teacher(name, age)
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(specialization, age, name)
  end

  def book(title, author, books_list)
    book = Book.new(title, author)
    books_list.push(book)
    FileIO.save_to_file('./data/books.json', books_list)
    puts 'The Book created successfully'
    puts 'Press Enter to continue!'
  end

  def rental(book_list, people_list, rentals)
    puts "\nSelect a book from the list by number:"
    book_list.each_with_index { |book, index| puts "#{index}) #{book['title']} by #{book['author']}" }
    index_book = gets.chomp.to_i
    book_obj = book_list[index_book]
    puts "\nSelect a person from the list by number [not id]:"
    people_list.each_with_index { |person, index| puts "#{index}) #{person['name']}" }
    index_person = gets.chomp.to_i
    std_obj = people_list[index_person]

    book_instance = Book.new(book_obj['title'], book_obj['author'])

    classroom = Classroom.new(std_obj['classroom'])
    std_instance = Student.new(classroom, std_obj['age'], std_obj['name'], id: std_obj['id'])

    print "\nDate: "
    date = gets.chomp

    new_rental = Rental.new(date, book_instance, std_instance)
    rentals << new_rental

    FileIO.save_to_file('./data/rentals.json', rentals)

    puts "\nThe Rental created successfully"
    puts 'Press Enter to continue!'
    gets.chomp
  end
end
