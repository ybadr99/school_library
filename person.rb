require './nameable'
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end

  def add_rental(date, book)
    rental = Rental.new(date, self, book)
    @rentals << rental
    rental
  end

  private

  def generate_id
    rand(1000..9999)
  end

  def of_age?
    @age >= 18
  end
end
