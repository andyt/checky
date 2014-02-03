require "checky/version"
require "checky/app"
require "checky/checker"
require "checky/checks"

module Checky
  class << self
    def config_path
      File.join(File.expand_path('../../', __FILE__), 'config', 'checks.rb')
    end

    def configure(&block)
      if block_given?
        instance_eval &block
      else
        @checks = []
        load config_path
      end
    end

    def checks
      @checks ||= []
    end
  end
end
