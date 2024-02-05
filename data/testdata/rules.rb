# frozen_string_literal: true

# vacldata
module VAclData
  # testdata
  module TestData
    RULES = [
      { permit: false, source_address: '192.168.1.200/32', destination_address: '10.0.0.200/32',
        destination_port: 443, protocol: 'tcp' },
      { permit: true, source_address: '192.168.1.100/32', source_port: 1234, destination_address: '10.0.0.100/32',
        destination_port: 443, protocol: 'tcp' },
      { permit: true, source_address: '192.168.1.0/24', destination_address: '10.0.0.0/24',
        destination_port: 80, protocol: 'tcp' },
      { permit: true, source_address: '192.168.1.0/24', destination_address: '10.0.0.0/24',
        destination_port: 123, protocol: 'udp' },
      { permit: true, source_address: '192.168.1.99/32', destination_address: '10.0.0.99/32', protocol: 'icmp' }
    ].freeze
  end
end
