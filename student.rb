require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission: true, classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts '¯(ツ)/¯'
  end
end

yousef_st = Student.new(23, 'ybadr', true, 'B12')

p yousef_st
