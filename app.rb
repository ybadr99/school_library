require_relative 'rental'
require_relative 'classroom'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'lists'
require_relative 'create'
require_relative 'file_io'

class App
  def initialize()
    @people_list = FileIO.load_file('./data/people.json')
    @books_list = FileIO.load_file('./data/books.json')
    @rentals = FileIO.load_file('./data/rentals.json')
    @list = List.new
    @create = Create.new
  end

  def list_books
    @list.books
    puts 'Press Enter to continue!'
    gets.chomp
  end

  def list_people
    @list.people
    puts 'Press Enter to continue!'
    gets.chomp
  end

  def create_person(choice, name, age)
    @create.people(choice, name, age, @people_list)
    gets.chomp
  end

  def create_book(title, author)
    @create.book(title, author, @books_list)
    gets.chomp
  end

  def create_rental
    @create.rental(@books_list, @people_list, @rentals)
    gets.chomp
  end

  def list_rentals
    @list.rentals
    gets.chomp
  end
end
