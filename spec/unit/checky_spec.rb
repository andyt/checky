require 'spec_helper'
require 'checky'
require 'checky/checks'

describe Checky do
  context 'when configured' do
    before { Checky.configure }
    it 'should return configured checks' do
      expect(Checky.checks).to be_a Array
      expect(Checky.checks.size).to eq 2
    end
  end
end