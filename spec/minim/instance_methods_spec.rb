describe Minim::InstanceMethods do
  describe '#validates' do
    context 'when there is no class attribute' do
      it 'raises Minim::Exceptions::AttributesNotInformed' do
        expect {
          klass = Class.new do
            include Minim::Model

            validates :name, presence: true
          end
        }.to raise_error(Minim::Exceptions::MissingAttributeError, "Attribute 'name' not Found")
      end
    end

    context 'when not located an attribute' do
      it 'raises Minim::Exceptions::MissingAttributeError' do
        expect {
          klass = Class.new do
            include Minim::Model
            attr_accessor :surname

            validates :name, :surname, presence: true
          end
        }.to raise_error(Minim::Exceptions::MissingAttributeError, "Attribute 'name' not Found")
      end
    end

    context 'when the validation not passed' do
      it 'raises Minim::Exceptions::AttributesNotInformed' do
        expect {
          klass = Class.new do
            include Minim::Model

            validates :name
          end
        }.to raise_error(Minim::Exceptions::MissingValidationError, "A validation must be passed")
      end
    end
  end
end
