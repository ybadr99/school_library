require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(specialization, age, name = 'Unknown', id: nil)
    super(age, name, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    { 'id' => @id, 'name' => @name, 'age' => @age, 'specialization' => @specialization, 'type' => 'Teacher' }
  end
end
