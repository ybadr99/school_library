require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', id: nil, parent_permission: true)
    super(age, name, id: id, parent_permission: parent_permission)
    @classroom = classroom
    classroom.students << self
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def to_hash
    { 'id' => @id, 'name' => @name, 'age' => @age, 'classroom' => @classroom.label, 'type' => 'Student' }
  end
end
