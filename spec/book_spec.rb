require_relative '../book'
require_relative '../person'
require_relative '../rental'

RSpec.describe Book do
  let(:book_title) { 'Sample Book' }
  let(:book_author) { 'John Doe' }
  let(:book) { Book.new(book_title, book_author) }

  # Test the initialization of the Book class
  describe '#initialize' do
    it 'creates a book with the correct title and author' do
      expect(book.title).to eq(book_title)
      expect(book.author).to eq(book_author)
    end

    it 'initializes an empty rentals array' do
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    let(:std1) { Person.new(20, 'ahmed') }
    let(:std2) { Person.new(25, 'mohamed') }
    let(:rental1) { Rental.new('2023-08-04', book, std1) }
    let(:rental2) { Rental.new('2023-08-05', book, std2) }
    it 'adds rentals to the rentals array' do
      p rental1
      book.add_rental(rental1)
      book.add_rental(rental2)
      expect(book.rentals).to include(rental1, rental2)
    end

    it 'sets the book for the rentals' do
      expect(rental1.book).to eq(book)
      expect(rental2.book).to eq(book)
    end
  end

  
  describe '#to_hash' do
    it 'returns a hash with the correct keys and values' do
      expected_hash = {
        'title' => book_title,
        'author' => book_author,
        "rental" => nil
         
      }
      expect(book.to_hash).to eq(expected_hash)
    end
  end
end
