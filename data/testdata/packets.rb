# frozen_string_literal: true

# vacldata
module VAclData
  # testdata
  module TestData
    PACKETS = [
      {
        source_address: '192.168.1.100',
        destination_address: '10.0.0.2',
        destination_port: 80,
        protocol: 'tcp'
      },
      {
        source_address: '192.168.1.100',
        destination_address: '10.0.0.2',
        destination_port: 123,
        protocol: 'udp'
      },
      {
        source_address: '192.168.1.100',
        source_port: 1234,
        destination_address: '10.0.0.2',
        destination_port: 80,
        protocol: 'tcp'
      },
      { source_address: '192.168.1.100/32',
        source_port: 1234,
        destination_address: '10.0.0.100/32',
        destination_port: 443,
        protocol: 'tcp' },
      {
        source_address: '192.168.1.99',
        destination_address: '10.0.0.99',
        protocol: 'icmp'
      }
    ].freeze

    E_PACKETS = [
      {
        source_address: '192.168.2.1',
        destination_address: '10.0.0.2',
        destination_port: 80,
        protocol: 'tcp'
      },
      {
        source_address: '192.168.1.100',
        destination_address: '10.0.2.2',
        destination_port: 80,
        protocol: 'tcp'
      },
      {
        source_address: '192.168.1.100',
        destination_address: '10.0.0.2',
        destination_port: 1234,
        protocol: 'tcp'
      },
      {
        source_address: '192.168.1.100',
        destination_address: '10.0.0.2',
        destination_port: 80,
        protocol: 'udp'
      },
      {
        source_address: '192.168.1.200',
        destination_address: '10.0.0.200',
        destination_port: 443,
        protocol: 'tcp'
      },
      { source_address: '192.168.1.100/32',
        source_port: 9876,
        destination_address: '10.0.0.100/32',
        destination_port: 443,
        protocol: 'tcp' },
      {
        source_address: '192.168.1.98',
        destination_address: '10.0.0.99',
        protocol: 'icmp'
      },
      {
        source_address: '192.168.1.99',
        destination_address: '10.0.0.98',
        protocol: 'icmp'
      }
    ].freeze
  end
end
