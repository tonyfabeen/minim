require 'ostruct'

describe Minim::Validations::Presence do
  describe '#validate' do
    context 'when a single attribute' do
      context 'and all of them are empty' do
        let(:klass) { OpenStruct.new(name: nil) }

        subject { described_class.new(klass, [:name]) }

        before { subject.validate }

        it 'will have errors' do
          expect(subject.errors).to_not be_empty
          expect(subject.errors).to have_key(:name)
          expect(subject.errors[:name]).to eq('must be present')
        end
      end
    end

    context 'when multiple attributes' do
      context 'and all of them are empty' do
        let(:klass) { OpenStruct.new(name: nil, surname: nil) }

        subject { described_class.new(klass, [:name, :surname]) }

        before { subject.validate }

        it 'will have errors' do
          expect(subject.errors).to_not be_empty

          expect(subject.errors).to have_key(:name)
          expect(subject.errors[:name]).to eq('must be present')

          expect(subject.errors).to have_key(:surname)
          expect(subject.errors[:surname]).to eq('must be present')
        end
      end

      context 'and just one is empty' do
        let(:klass) { OpenStruct.new(name: 'Some Name', surname: nil) }

        subject { described_class.new(klass, [:name, :surname]) }

        before { subject.validate }

        it 'will have errors' do
          expect(subject.errors).to_not be_empty
          expect(subject.errors).to_not have_key(:name)

          expect(subject.errors).to have_key(:surname)
          expect(subject.errors[:surname]).to eq('must be present')
        end
      end
    end
  end
end
