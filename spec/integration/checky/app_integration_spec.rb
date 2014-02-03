require 'spec_helper'
require 'rack/test'
require 'checky'

module Checky
  describe App do
    include Rack::Test::Methods

    def app
      @app ||= Rack::Builder.parse_file('config.ru').first
    end

    describe '/' do
      context 'when unauthorized' do
        it 'should respond with a 401' do
          get '/'
          expect(last_response.status).to be 401
        end
      end

      context 'when authorized' do
        before do
          basic_authorize 'checky', 'chocky'
        end

        it 'should respond with results' do
          get '/'
          expect(last_response.status).to be 200
          expect(last_response.body).to eq 'TCP socket connection to example.com:80 (timeout: 15) PASSED'
        end
      end
    end
  end
end