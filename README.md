# vacl

The vacl is a simple Ruby library for managing network traffic rules and performing traffic checking based on ACLs.

## Usage

### Packet Class

The `Packet` class in the `VAcl` module represents a network packet with source and destination addresses, ports, and protocol.

```ruby
require_relative 'lib/vacl'

# Create a packet
packet = VAcl::Packet.new(
  source_address: '192.168.1.1',
  destination_address: '192.168.2.2',
  source_port: 8080,
  destination_port: 80,
  protocol: 'tcp'
)
```

### Rule Class

The `Rule` class extends the `Packet` class and represents a rule for Access Control Lists (ACL).

```ruby
require_relative 'lib/vacl'

# Create an ACL rule
acl_rule = VAcl::Rule.new(
  permit: true,
  source_address: '192.168.1.0/24',
  destination_address: '192.168.2.2',
  source_port: 8080,
  destination_port: 80,
  protocol: 'tcp'
)
```

### TrafficController Class

The `TrafficController` class manages traffic rules and performs traffic checking based on ACLs.

```ruby
require_relative 'lib/vacl'

# Create a traffic controller
traffic_controller = VAcl::TrafficController.new

# Register an ACL rule
traffic_controller.regist(acl_rule)

# Check if a packet is permitted
result = traffic_controller.check_traffic(packet)
puts "Packet is #{result ? 'permitted' : 'denied'}"
```
