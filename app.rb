# frozen_string_literal: true

require_relative 'lib/vacl'
require_relative 'data/data'

@traffic_controller = VAcl::TrafficController.new
# ACL Rules
VAclData::TestData::RULES.each do |rule|
  p rule
  acl_rule = VAcl::Rule.new(rule)
  @traffic_controller.regist(acl_rule)
end

(VAclData::TestData::PACKETS + VAclData::TestData::E_PACKETS).each do |packet|
  traffic_packet = VAcl::Packet.new(packet)
  puts traffic_packet
  p @traffic_controller.check_traffic(traffic_packet)
  puts
end
