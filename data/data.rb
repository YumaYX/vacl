# frozen_string_literal: true

# vacldata
module VAclData; end

# vacldata
Dir.glob("#{__dir__}/*/*.rb").sort.each { |data| require(data) }
