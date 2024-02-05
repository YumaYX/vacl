# frozen_string_literal: true

require_relative './helper'

class TestVAclPacket < Minitest::Test
  def test_new_packet
    packet_params = { source_address: '192.168.1.1', destination_address: '10.0.0.1', source_port: 1234,
                      destination_port: 5678, protocol: 'TCP' }
    packet = VAcl::Packet.new(packet_params)

    assert_equal(IPAddr.new('192.168.1.1/32'), packet.source_address)
    assert_equal(IPAddr.new('10.0.0.1/32'), packet.destination_address)
    assert_equal(1234, packet.source_port)
    assert_equal(5678, packet.destination_port)
    assert_equal(:tcp, packet.protocol)
  end

  def test_new_packet_nil_source_port
    packet_params = { source_address: '192.168.1.1', destination_address: '10.0.0.1',
                      destination_port: 5678, protocol: 'TCP' }
    packet = VAcl::Packet.new(packet_params)
    assert_nil(packet.source_port)
  end

  def test_new_packet_invalid_ip
    packet_params = { source_address: 'a.a.a.a', destination_address: '10.0.0.1',
                      destination_port: 5678, protocol: 'TCP' }
    e = assert_raises ArgumentError do
      VAcl::Packet.new(packet_params)
    end
    assert_equal('Invalid IP address: a.a.a.a', e.message)
  end

  def test_new_packet_invalid_protocol
    packet_params = { source_address: '192.168.1.1', destination_address: '10.0.0.1',
                      destination_port: 5678, protocol: 'xxx' }
    e = assert_raises RuntimeError do
      VAcl::Packet.new(packet_params)
    end
    assert_equal('Invalid protocol xxx', e.message)
  end

  def test_new_packet_invalid
    e = assert_raises ArgumentError do
      VAcl::Packet.new({})
    end
    assert_match('Missing required parameter:', e.message)
  end
end
