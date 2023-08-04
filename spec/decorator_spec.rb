require_relative '../decorator'

RSpec.describe Nameable do
  describe '#correct_name' do
    it 'raises NotImplementedError' do
      expect { subject.correct_name }.to raise_error(NotImplementedError)
    end
  end
end

RSpec.describe Decorator do
  describe '#correct_name' do
    it 'forwards the call to the wrapped object' do
      wrapped_object = double('Nameable')
      expect(wrapped_object).to receive(:correct_name).and_return('John')

      decorator = Decorator.new(wrapped_object)
      expect(decorator.correct_name).to eq('John')
    end
  end
end

RSpec.describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'capitalizes the wrapped object name' do
      wrapped_object = double('Nameable')
      expect(wrapped_object).to receive(:correct_name).and_return('john')

      decorator = CapitalizeDecorator.new(wrapped_object)
      expect(decorator.correct_name).to eq('John')
    end
  end
end

RSpec.describe TrimmerDecorator do
  describe '#correct_name' do
    it 'trims the wrapped object name to 10 characters' do
      wrapped_object = double('Nameable')
      expect(wrapped_object).to receive(:correct_name).and_return('John Doe Smith')

      decorator = TrimmerDecorator.new(wrapped_object)
      expect(decorator.correct_name).to eq('John Doe S')
    end
  end
end
