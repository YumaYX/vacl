# frozen_string_literal: true

module VAcl
  # Represents a rule for Access Control Lists (ACL).
  class Rule < VAcl::Packet
    # @!attribute [rw] permit
    #   @return [Boolean] true if the rule permits the packet, false if it denies.
    attr_accessor :permit

    # Initializes a new Rule object.
    #
    # @param [Hash] options The options to initialize the rule.
    # @option options [Boolean] :permit Whether the rule permits or denies the packet.
    # @option options [String] :source_address The source IP address.
    # @option options [String] :destination_address The destination IP address.
    # @option options [Integer] :source_port The source port.
    # @option options [Integer] :destination_port The destination port.
    # @option options [String] :protocol The protocol (must be one of 'tcp', 'udp', or 'icmp').
    def initialize(options = {})
      super
      @permit = options[:permit]
    end

    # Validates the presence of required parameters.
    #
    # @param [Hash] params The parameters to validate.
    # @raise [ArgumentError] if any required parameter is missing.
    def validate_params(params)
      required_params = %i[permit source_address destination_address protocol]
      required_params.each do |param|
        raise ArgumentError, "Missing required parameter: #{param}" unless params.key?(param)
      end
    end

    # Returns a string representation of the rule.
    #
    # @return [String] the formatted rule information.
    def to_s
      "ACLRule: #{@permit ? 'Permit' : 'Deny'}, Source: #{@source_address}:#{@source_port},
      Destination: #{@destination_address}:#{@destination_port}, Protocol: #{@protocol}"
    end
  end
end
