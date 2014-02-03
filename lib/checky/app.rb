module Checky
  class App
    class << self
      def call(env)
        checker = Checky::Checker.new(Checky.checks)
        checker.call

        response = Rack::Response.new
        response.body = [checker.to_a.join("\n")]
        response['Content-Type'] = 'text/plain'
        response.status = checker.pass? ? 200 : 500

        response.finish
      end
    end
  end
end