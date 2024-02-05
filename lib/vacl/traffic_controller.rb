# frozen_string_literal: true

module VAcl
  # Manages traffic rules and performs traffic checking based on Access Control Lists (ACLs).
  class TrafficController
    # @!attribute [r] acls
    #   @return [Array<Rule>] the array of registered ACL rules.
    attr_reader :acls

    # Initializes a new TrafficController object.
    def initialize
      @acls = []
    end

    # Registers an ACL rule.
    #
    # @param [Rule] rule The ACL rule to register.
    def regist(rule)
      @acls << rule
    end

    # Checks if a packet is permitted or denied based on the registered ACL rules.
    #
    # @param [Packet] packet The network packet to check.
    # @return [Boolean] true if the packet is permitted, false if denied.
    def check_traffic(packet)
      @acls.each do |rule|
        next unless rule.protocol.eql?(packet.protocol)

        unless rule.protocol.eql?(:icmp)
          next unless valid_source_port?(rule.source_port, packet.source_port)
          next unless valid_source_port?(rule.destination_port, packet.destination_port)
        end

        next unless rule.source_address.include?(packet.source_address)
        next unless rule.destination_address.include?(packet.destination_address)

        return rule.permit
      end
      false
    end

    # Checks if the source port in the packet is valid based on the rule's source port.
    #
    # @param [Integer, nil] rule_port The source port specified in the ACL rule.
    # @param [Integer, nil] packet_port The source port in the packet.
    # @return [Boolean] true if the source port is valid, false otherwise.
    def valid_source_port?(rule_port, packet_port)
      return true if rule_port.nil?

      if packet_port.nil?
        false
      else
        rule_port.eql?(packet_port)
      end
    end
  end
end
