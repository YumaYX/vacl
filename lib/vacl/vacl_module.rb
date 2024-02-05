# frozen_string_literal: true

require 'ipaddr'

module VAcl
  # Provides utility methods for manipulating IP addresses.
  module VAclModule
    class << self
      # Edits the format of the given IP address string.
      #
      # @param [String] str The IP address string to format.
      # @return [String] the formatted IP address string.
      def edit_format_for_ipaddr(str)
        string = str.strip
        string.gsub!(/(\s)+/, ' ')
        string.gsub!(%r{\s*/\s*}, '/')
        string.gsub(/\s/, '/')
      end
    end
  end
end
