require_relative 'app'

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
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      app.create_a_book(title, author)
      number = list_numbers
    when '5'
      app.create_a_rental
      number = list_numbers
    when '6'
      app.list_all_rentals
      number = list_numbers
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
