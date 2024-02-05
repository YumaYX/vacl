# frozen_string_literal: true

require 'ipaddr'

module VAcl
  # vaclmodule
  module VAclModule
    class << self
      def edit_format_for_ipaddr(str)
        string = str.strip
        string.gsub!(/(\s)+/, ' ')
        string.gsub!(%r{\s*/\s*}, '/')
        string.gsub(/\s/, '/')
      end
    end
  end
end
