# require "fakeweb"
require "minitest"
require "minitest/unit"
require "minitest/autorun"
require "mocha/setup"

require_relative "../lib/interneeee"

class InterneeeeTest < MiniTest::Unit::TestCase
  def test_run_yes
    ping_mock = mock()
    Net::Ping::External.expects(:new).with("HOST_TEST").returns(ping_mock)
    ping_mock.expects(:ping?).returns(true)
    Kernel.expects(:puts).with("Yeeeeees!")

    Interneeee::Runner.new(false, "HOST_TEST", 0).run
  end

  def test_run_no
    ping_mock = mock()
    Net::Ping::External.expects(:new).with("HOST_TEST").returns(ping_mock)
    ping_mock.expects(:ping?).returns(false)
    Kernel.expects(:puts).with("Nop")

    Interneeee::Runner.new(false, "HOST_TEST", 0).run
  end

end

