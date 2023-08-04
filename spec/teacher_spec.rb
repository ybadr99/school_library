require_relative '../teacher'

RSpec.describe Teacher do
    let(:name) { 'renim' }
    let(:age) { 23 }
    let(:specialization) {'English'}
    let(:teacher) { Teacher.new(specialization, age, name) }

    describe '#initialize' do
    it 'should initialize new teacher' do
      expect(teacher.name).to eq(name)
      expect(teacher.age).to eq(age)
      expect(teacher.specialization).to eq(specialization)
    end
  end

  describe '#can use service' do
  it 'returns true' do
    expect(teacher.can_use_services?).to be_truthy
  end
end


describe '#to_hash' do
it 'returns a hash with the correct keys and values' do
  expected_hash = {
    'id' => teacher.id,
    'name' => name,
    'age' => age,
    'specialization' => specialization,
    'type' => 'Teacher'
  }
  expect(teacher.to_hash).to eq(expected_hash)
end
end
  
end