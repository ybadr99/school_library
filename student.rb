require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true, id: nil)
    super(age, name, parent_permission: parent_permission, id: id)
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
