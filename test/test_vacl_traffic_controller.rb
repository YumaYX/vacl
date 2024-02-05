# frozen_string_literal: true

require_relative './helper'

class TestVAclRule < Minitest::Test
  def setup
    @traffic_controller = VAcl::TrafficController.new
    # ACL Rules
    VAclData::TestData::RULES.each do |rule|
      acl_rule = VAcl::Rule.new(rule)
      @traffic_controller.regist(acl_rule)
    end
  end

  def test_permit
    VAclData::TestData::PACKETS.each do |packet|
      traffic_packet = VAcl::Packet.new(packet)
      assert(@traffic_controller.check_traffic(traffic_packet))
    end
  end

  def test_deny
    VAclData::TestData::E_PACKETS.each do |packet|
      traffic_packet = VAcl::Packet.new(packet)
      assert(!@traffic_controller.check_traffic(traffic_packet))
    end
  end
end
