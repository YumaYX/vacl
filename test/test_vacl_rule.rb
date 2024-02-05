# frozen_string_literal: true

require_relative './helper'

class TestVAclRule < Minitest::Test
  def test_inherit
    rule = VAcl::Rule.new(permit: true, source_address: '192.168.1.1', source_port: 80, destination_address: '10.0.0.1',
                          destination_port: 8080, protocol: 'TCP')

    assert(rule.permit)
    assert_equal(IPAddr.new('192.168.1.1/32'), rule.source_address)
    assert_equal(IPAddr.new('10.0.0.1/32'), rule.destination_address)
    assert_equal(80, rule.source_port)
    assert_equal(8080, rule.destination_port)
    assert_equal(:tcp, rule.protocol)
  end

  def test_new_rule_invalid_permit
    e = assert_raises ArgumentError do
      VAcl::Rule.new({})
    end
    assert_equal('Missing required parameter: permit', e.message)
  end
end
