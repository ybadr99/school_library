class Classroom
  attr_reader :student
  attr_accessor :lable

  def initialize(lable)
    @lable = lable
    @student = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
