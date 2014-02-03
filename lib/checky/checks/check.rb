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
      def self.dsl_method(name = nil)
        if name
          @dsl_method = name
          Checky.register(self)
        end
        @dsl_method
      end
    end
  end
end