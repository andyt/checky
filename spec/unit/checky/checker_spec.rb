require 'spec_helper'
require 'checky/checker'

module Checky
  describe Checker do
    let(:check1) { double }
    let(:check2) { double }
    let(:checker) do
      Checker.new([check1, check2])
    end

    describe '#call' do
      it 'should call each check' do
        expect(check1).to receive(:call)
        expect(check2).to receive(:call)
        checker.call
      end
    end

    describe '#to_a' do
      it 'should collect a result string from each check' do
        expect(check1).to receive(:to_s)
        expect(check2).to receive(:to_s)
        checker.to_a
      end
    end
  end
end