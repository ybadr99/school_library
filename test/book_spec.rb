require_relative '../book'
require_relative '../rental'

RSpec.describe Book do
  let(:book_title) { 'Sample Book' }
  let(:book_author) { 'John Doe' }
  let(:rental) { [] }

  # Test the initialization of the Book class
  describe '#initialize' do
    it 'creates a book with the correct title and author' do
      book = Book.new(book_title, book_author)
      expect(book.title).to eq(book_title) # Here, we're using the book_title let variable
      expect(book.author).to eq(book_author) # And here, we're using the book_author let variable
    end

    it 'initializes an empty rentals array' do
      book = Book.new(book_title, book_author)
      expect(book.rentals).to be_empty
    end
  end

end