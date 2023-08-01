require_relative 'teacher'
require_relative 'student'
require_relative 'person'
require_relative 'lists'
require_relative 'rental'
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
    classroom = Classroom.new(label)
    Student.new(classroom, age, name, parent_permission: parent_permission)
  end

  def create_a_teacher(name, age)
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(specialization, age, name)
  end

  def book(title, author, books_list)
    book = Book.new(title, author)
    books_list.push(book)
    puts 'The Book created successfully'
    puts 'Press Enter to continue!'
  end

  def rental(book_list, people_list, rentals)
    puts '
Select a book from list by number'
    @list.books(book_list)
    index_book = gets.chomp.to_i
    puts '
Select a person from list by number [not id]'
    @list.people(people_list)
    index_person = gets.chomp.to_i
    print '
Date: '
    date = gets.chomp
    rental = Rental.new(date, book_list[index_book], people_list[index_person])
    rentals.push(rental)
    puts 'The Rental created successfully'
    puts 'Press Enter to continue!'
  end
end
