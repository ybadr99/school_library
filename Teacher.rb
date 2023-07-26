require_relative 'Person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name = 'Unknown', parent_permissions: true, specialization)
    super(age, name, parent_permissions)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
