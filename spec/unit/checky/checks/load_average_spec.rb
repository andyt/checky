require 'spec_helper'
require 'checky/checks/load_average'

module Checky::Checks
  describe LoadAverage do
    let(:check) {
      LoadAverage.new(3, 3, 3)
    }

    context 'When the load is high' do
      before { expect(File).to receive(:read).and_return('4 5 6 1234 5678') }
      it 'returns false' do
        expect(check.call).to eq false
        expect(check.error.to_s).to eq '4.0, 5.0, 6.0'
      end
    end

    context 'When the load is acceptable' do
      before { expect(File).to receive(:read).and_return('0.5 0.6 0.7 1234 5678') }
      it 'returns true' do
        expect(check.call).to eq true
      end
    end
  end
end