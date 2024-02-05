# frozen_string_literal: true

# vacl
module VAcl; end

Dir.glob("#{__dir__}/*/*.rb").sort.each { |lib| require(lib) }
