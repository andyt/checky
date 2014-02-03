require 'checky/checks/check'

module Checky
  module Checks

    # Linux only.
    class LoadAverage < Check
      dsl_method :load_average

      # Supply the one, five and fifteen minute thresholds for failure.
      def initialize(la1, la5, la15)
        @la1, @la5, @la15 = la1, la5, la15
      end

      def call
        super do
          now1, now5, now15 = File.read('/proc/loadavg').split(' ')[0..2].map(&:to_f)
          raise "%s, %s, %s" % [now1, now5, now15] if now1 > @la1 || now5 > @la5 || now15 > @la15
        end
      end

      def to_s
        super('Load average max of %s, %s, %s' % [@la1, @la5, @la15])
      end
    end
  end
end