module Checky
  def self.register(klass)
    (class << self; self; end).instance_eval do
      define_method klass.dsl_method do |*args|
        checks << klass.new(*args)
      end
    end
  end

  module Checks
    class Check

      DEFAULT_TIMEOUT = 15 

      attr :result, :error, :timeout

      def self.dsl_method(name = nil)
        if name
          @dsl_method = name
          Checky.register(self)
        end
        @dsl_method
      end

      def call
        @timeout ||= DEFAULT_TIMEOUT
        Timeout.timeout(@timeout) do
          yield
        end
        @result = true
      rescue StandardError => e
        @error = e
        @result = false
      end

      def called?
        !@result.nil?
      end

      def pass?
        @result
      end

      def fail?
        !@result
      end

      def to_s(base)
        return base unless called?
        base + (pass? ? ' PASSED' : (error ? 'FAILED (%s)' % error : ' FAILED'))
      end
    end
  end
end