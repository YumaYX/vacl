# frozen_string_literal: true

require_relative 'vacl_module'

module VAcl
  # Represents a network packet with source and destination addresses, ports, and protocol.
  class Packet
    # @!attribute [rw] source_address
    #   @return [IPAddr] the source IP address of the packet.
    attr_accessor :source_address

    # @!attribute [rw] destination_address
    #   @return [IPAddr] the destination IP address of the packet.
    attr_accessor :destination_address

    # @!attribute [rw] source_port
    #   @return [Integer] the source port of the packet.
    attr_accessor :source_port

    # @!attribute [rw] destination_port
    #   @return [Integer] the destination port of the packet.
    attr_accessor :destination_port

    # @!attribute [rw] protocol
    #   @return [Symbol] the protocol of the packet, must be one of :tcp, :udp, or :icmp.
    attr_accessor :protocol

    # Initializes a new Packet object.
    #
    # @param [Hash] params The parameters to initialize the packet.
    # @option params [String] :source_address The source IP address.
    # @option params [String] :destination_address The destination IP address.
    # @option params [Integer] :source_port The source port.
    # @option params [Integer] :destination_port The destination port.
    # @option params [String] :protocol The protocol (must be one of 'tcp', 'udp', or 'icmp').
    def initialize(params = {})
      validate_params(params)
      @source_address = to_ipaddr(params[:source_address])
      @destination_address = to_ipaddr(params[:destination_address])
      @source_port = params[:source_port]
      @destination_port = params[:destination_port]
      @protocol = params[:protocol]
      validate_protocol
    end

    # Validates the presence of required parameters.
    #
    # @param [Hash] params The parameters to validate.
    # @raise [ArgumentError] if any required parameter is missing.
    def validate_params(params)
      required_params = %i[source_address destination_address protocol]
      required_params.each do |param|
        raise ArgumentError, "Missing required parameter: #{param}" unless params.key?(param)
      end
    end

    # Converts a string IP address to an IPAddr object.
    #
    # @param [String] address The IP address to convert.
    # @return [IPAddr] the IP address as an IPAddr object.
    # @raise [ArgumentError] if the address is not a valid IP address.
    def to_ipaddr(address)
      ip_address = VAcl::VAclModule.edit_format_for_ipaddr(address)
      IPAddr.new(ip_address)
    rescue IPAddr::InvalidAddressError
      raise ArgumentError, "Invalid IP address: #{address}"
    end

    # Validates and normalizes the protocol.
    #
    # @raise [RuntimeError] if the protocol is not one of :tcp, :udp, or :icmp.
    def validate_protocol
      @protocol = @protocol.strip.downcase.to_sym
      valid_protocols = %i[tcp udp icmp]
      raise "Invalid protocol #{@protocol}" unless valid_protocols.include?(@protocol)
    end

    # Returns a string representation of the packet.
    #
    # @return [String] the formatted packet information.
    def to_s
      <<~STRING
        Source Address: #{@source_address}
        Destination Address: #{@destination_address}
        Source Port: #{@source_port}
        Destination Port: #{@destination_port}
        Protocol: #{@protocol}
      STRING
    end
  end
end
