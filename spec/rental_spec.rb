require_relative '../rental'
require_relative '../book'
require_relative '../person'

RSpec.describe Rental do
  before :each do
    # Create instances of Book and Person
    book = Book.new('Book1', 'me')
    person = Person.new(25, 'Person1', parent_permission: true)

    # Pass the instances to the Rental constructor
    @rental = Rental.new('2023', book, person)
  end

  describe '#retrieve right data' do
    it 'should return the right date' do
      expect(@rental.date).to eq('2023')
    end

    it 'returns the correct Book' do
      expect(@rental.book.title).to eql 'Book1'
      expect(@rental.book.author).to eql 'me'
    end

    it 'returns the correct person' do
      expect(@rental.person.name).to eql 'Person1'
      expect(@rental.person.age).to eql 25
    end
  end
end
