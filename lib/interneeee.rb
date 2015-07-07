require_relative "interneeee/version"
require "net/ping"

module Interneeee
  class Runner
    attr_reader :loop_active
    attr_reader :ping
    attr_reader :sleep_time

    def initialize(loop_active = true, host = "8.8.8.8", sleep_time = 5)
      @loop_active = loop_active
      @sleep_time = sleep_time
      @ping = Net::Ping::External.new(host)
    end

    def run
      loop do
        if @ping.ping?
          Kernel.puts "Yeeeeees!"
          sleep(sleep_time)
        else
          Kernel.puts "Nop"
        end
        break if !loop_active
      end
    end
  end
end