describe Minim::Model do
  context 'Given a Ruby class which includes Minim::Model' do
    let(:klass) do
      Class.new { include Minim::Model }
    end

    it { expect(klass).to respond_to(:validates) }
  end
end
