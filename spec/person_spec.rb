require_relative '../person'
require_relative '../book'
require_relative '../rental'

RSpec.describe Person do
  let(:name) { 'yousef' }
  let(:age) { 23 }
  let(:parent_permission) { true }
  let(:person) { Person.new(age, name, parent_permission: parent_permission) }

  describe '#initialize' do
    it 'should initialize new person' do
      expect(person.name).to eq(name)
      expect(person.age).to eq(age)
      expect(person.instance_variable_get(:@parent_permission)).to eq(parent_permission)
    end

    it 'initializes an empty rentals array' do
      expect(person.rentals).to be_empty
    end
  end

  describe '#can_use_services?' do
    context 'when age > 20' do
      let(:age) { 20 }
      it 'returns true' do
        expect(person.can_use_services?).to be_truthy
      end
    end

    context 'when person is under age with parent permission' do
      let(:age) { 16 }
      let(:parent_permission) { true }

      it 'returns true' do
        expect(person.can_use_services?).to be_truthy
      end
    end

    context 'when person is under age ' do
      let(:age) { 16 }
      let(:parent_permission) { false }

      it 'returns true' do
        expect(person.can_use_services?).to be_falsey
      end
    end
  end

  describe '#add rental' do
    let(:book) { Book.new('book1', 'me') }
    let(:rental) { Rental.new('2000-1-1', book, person) }

    it 'should create a rental' do
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end

    it 'sets the person for the rental' do
      expect(rental.person).to eq(person)
    end
  end
end
