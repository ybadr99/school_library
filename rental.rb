class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book&.add_rental(self)
    @person = person
    person&.add_rental(self)
  end

  def to_hash
    {
      'date' => @date,
      'book' => @book.to_hash,
      'person' => @person.to_hash
    }
  end
end
