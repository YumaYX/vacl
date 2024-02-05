# frozen_string_literal: true

# vacldata
module VAclData
  # testdata
  module TestData
    PACKETS = [
      {
        source_address: '192.168.1.1',
        destination_address: '10.0.0.1',
        destination_port: 5678,
        protocol: 'TCP'
      },
      {
        source_address: '192.168.1.1',
        destination_address: '10.0.0.1',
        destination_port: 5678,
        protocol: 'UDP'
      },
      {
        source_address: '192.168.1.1',
        destination_address: '10.0.0.1',
        destination_port: 5678,
        protocol: 'ICMP'
      }
    ].freeze
  end
end
