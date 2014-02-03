module Checky
  class Checker
    attr :checks
    def initialize(checks)
      @checks = checks
    end

    def call
      threads.each { |t| t.join }
      checks
    end

    def threads
      @threads ||= checks.collect { |check| Thread.new { check.call } }
    end

    def to_a
      checks.map(&:to_s)
    end

    def pass?
      checks.all? { |c| c.pass? }
    end

    def fail?
      checks.any? { |c| c.fail? }
    end
  end
end