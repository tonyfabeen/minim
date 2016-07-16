describe Minim::InstanceMethods do
  describe '#validates' do
    context 'when there is no class attribute' do
      it 'raises Minim::Exceptions::AttributesNotInformed' do
        expect {
          klass = Class.new do
            include Minim::Validations

            validates :name, presence: true
          end
        }.to raise_error(Minim::Exceptions::MissingAttributeError, "Attribute 'name' not Found")
      end
    end

    context 'when not located an attribute' do
      it 'raises Minim::Exceptions::MissingAttributeError' do
        expect {
          klass = Class.new do
            include Minim::Validations
            attr_accessor :surname

            validates :name, :surname, presence: true
          end
        }.to raise_error(Minim::Exceptions::MissingAttributeError, "Attribute 'name' not Found")
      end
    end

    context 'when the validation not passed' do
      it 'raises Minim::Exceptions::MissingValidationError' do
        expect {
          klass = Class.new do
            include Minim::Validations

            validates :name
          end
        }.to raise_error(Minim::Exceptions::MissingValidationError, "A validation must be passed")
      end
    end

    context 'when the validation not registered' do
      it 'raises Minim::Exceptions::MissingValidationError' do
        expect {
          klass = Class.new do
            include Minim::Validations

            attr_accessor :name

            validates :name, surname_presence: true
          end
        }.to raise_error(Minim::Exceptions::MissingValidationError, "A validation must be registered")
      end
    end
  end
end
