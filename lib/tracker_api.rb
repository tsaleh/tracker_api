require 'tracker_api/version'

# dependencies
require 'virtus'
require 'faraday'
require 'faraday_middleware'

# stdlib
require 'addressable/uri'
require 'forwardable'
require 'logger'

Dir[File.expand_path('../tracker_api/*.rb', __FILE__)].each { |f| puts f; require f }
Dir[File.expand_path('../tracker_api/endpoints/*.rb', __FILE__)].each { |f| puts f; require f }
Dir[File.expand_path('../tracker_api/resources/*.rb', __FILE__)].each { |f| puts f; require f }

module TrackerApi
  module Errors
    class UnexpectedData < StandardError; end
  end
end
