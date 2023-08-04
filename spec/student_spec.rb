require_relative '../student'
require_relative '../classroom'


RSpec.describe Student do
  let(:name) { 'sumeya' }
  let(:age) { 24 }
  let(:classroom) { Classroom.new('4') }
  let(:parent_permission) { true }
  let(:std) { Student.new(classroom, age, name, parent_permission: parent_permission) }

  describe '#initialize' do
    it 'should initialize new student' do
      expect(std.name).to eq(name)
      expect(std.age).to eq(age)
      expect(std.classroom).to eq(classroom)
      expect(std.instance_variable_get(:@parent_permission)).to eq(parent_permission)
    end
  end

  describe '#play_hooky' do
    it 'returns the correct string' do
      expect(std.play_hooky).to eq('¯(ツ)/¯')
    end
  end

  describe '#to_hash' do
    it 'returns a hash with the correct keys and values' do
      expected_hash = {
        'id' => std.id,
        'name' => name,
        'age' => age,
        'classroom' => classroom.label,
        'type' => 'Student'
      }
      expect(std.to_hash).to eq(expected_hash)
    end
  end
end
