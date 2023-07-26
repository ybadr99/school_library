require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name = 'Unknown', parent_permissions: true, spec)
    super(age, name, parent_permissions)
    @specialization = spec
  end

  def can_use_services?
    true
  end
end

mo = Teacher.new(23,'math')
p mo