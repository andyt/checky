Dir[File.join(File.dirname(__FILE__), 'checks', '*.rb')].each { |f| require f }

module Checky
  module Checks
  end
end