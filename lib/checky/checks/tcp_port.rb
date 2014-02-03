require 'socket'
require 'checky/checks/check'

module Checky
  module Checks

    # Best to use this with an IP address otherwise we're testing DNS as well.
    # However, that might be the desired behaviour.
    class TCPPort < Check
      dsl_method :tcp_port
      
      attr :host, :port, :timeout, :result, :error
      def initialize(host, port, timeout)
        @host, @port, @timeout = host, port, timeout
      end

      def call
        Timeout.timeout(timeout) do
          socket = TCPSocket.new(host, port)
        end
        @result = true
      rescue StandardError => e
        @error = e
        @result = false
      end

      def pass?
        @result
      end

      def fail?
        !@result
      end

      def to_s
        'TCP socket connection to %s:%s (timeout: %s) ' % [host, port, timeout] +
          if pass?
            'PASSED'
          else
            'FAILED (%s)' % error
          end
      end
    end
  end
end