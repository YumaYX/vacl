# frozen_string_literal: true

require_relative 'vacl_module'

module VAcl
  # packet
  class Packet
    attr_accessor :source_address, :destination_address, :source_port, :destination_port, :protocol

    def initialize(params = {})
      validate_params(params)

      @source_address = to_ipaddr(params[:source_address])
      @destination_address = to_ipaddr(params[:destination_address])
      @source_port = params[:source_port]
      @destination_port = params[:destination_port]
      @protocol = params[:protocol]

      validate_protocol
    end

    def validate_params(params)
      required_params = %i[source_address destination_address destination_port protocol]
      required_params.each do |param|
        raise ArgumentError, "Missing required parameter: #{param}" unless params.key?(param)
      end
    end

    def to_ipaddr(address)
      ip_address = VAcl::VAclModule.edit_format_for_ipaddr(address)
      IPAddr.new(ip_address)
    rescue IPAddr::InvalidAddressError
      raise ArgumentError, "Invalid IP address: #{address}"
    end

    def validate_protocol
      @protocol = @protocol.strip.downcase.to_sym
      valid_protocols = %i[tcp udp icmp]
      raise "Invalid protocol #{@protocol}" unless valid_protocols.include?(@protocol)
    end

    def to_s
      "Source Address: #{@source_address}\n" \
      "Destination Address: #{@destination_address}\n" \
      "Source Port: #{@source_port}\n" \
      "Destination Port: #{@destination_port}\n" \
      "Protocol: #{@protocol}\n"
    end
  end
end
