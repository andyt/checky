require 'socket'
require 'checky/checks/check'

module Checky
  module Checks

    # Best to use this with an IP address otherwise we're testing DNS as well.
    # However, that might be the desired behaviour.
    class TCPPort < Check
      dsl_method :tcp_port

      attr :host, :port

      def initialize(host, port, timeout)
        @host, @port, @timeout = host, port, timeout
      end

      def call
        super do
          socket = TCPSocket.new(host, port)
        end
      end

      def to_s
        super('TCP socket connection to %s:%s (timeout: %s)' % [host, port, timeout])
      end
    end
  end
end