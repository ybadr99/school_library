require_relative 'decorator'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :type, :id
  attr_reader :rentals

  def initialize(age, name = 'Unknown', parent_permission: true, id: nil)
    super()
    @id = id || Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end

  def to_hash
    { 'name' => @name, 'age' => @age }
  end

  private

  def of_age?
    @age >= 18
  end
end
