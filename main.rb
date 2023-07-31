require_relative 'app'


def create_a_book(app)
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  app.create_a_book(title, author)
  list_numbers
end

def create_a_rental(app)
  app.create_a_rental
  list_numbers
end

def list_all_rentals(app)
  app.list_all_rentals
  list_numbers
end

def list_numbers()
  list = "
Please choose an option by enterin a number (1-7):
1 - List all books
2 - List all people
3 - Create a person
4 - Create a book
5 - Create a rental
6 - List all rentals for a given person id
7 - Exit
"
  puts list
  gets.chomp
end

def main()
  app = App.new
  puts 'Welcome to School Library App!'
  number = list_numbers

  loop do
    case number
    when '1'
      app.list_all_books
      number = list_numbers
    when '2'
      app.list_all_people
      number = list_numbers
    when '3'
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      choice = gets.chomp
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      app.create_a_person(choice, name, age)
      number = list_numbers
    when '4'
      number = create_a_book(app)
    when '5'
      number = create_a_rental(app)
    when '6'
      number = list_all_rentals(app)
    when '7'
      puts 'Thank you for using this app!'
      break
    else
      puts 'Invalid input'
      break
    end
  end
end

main
