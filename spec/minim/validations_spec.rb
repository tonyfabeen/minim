describe Minim::Validations do
  context 'Given a Ruby class which includes Minim::Validations' do
    let(:klass) do
      Class.new { include Minim::Validations }
    end

    it { expect(klass).to respond_to(:validates) }
  end
end
