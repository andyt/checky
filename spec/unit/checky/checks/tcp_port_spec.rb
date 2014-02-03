require 'spec_helper'
require 'checky/checks/tcp_port'

module Checky::Checks
  describe TCPPort do
    let(:check) {
      TCPPort.new('example.com', 80, 10)
    }

    context 'When the port is available within the timeout' do
      before { expect(TCPSocket).to receive(:new).and_return(true) }
      it 'returns true' do
        check.call.should eq true
      end
    end

    context 'When the port is not available' do
      [ Timeout::Error, Errno::ECONNREFUSED, Errno::ENETUNREACH ].each do |error|
        context 'due to %s' % error do
          before { expect(TCPSocket).to receive(:new) { raise error } }
          it 'returns false' do
            check.call.should eq false
          end
        end
      end
    end

  end
end