require 'rspec_api_docs/version'

module RspecApiDocs
  METADATA_NAMESPACE = :rspec_api_docs

  BaseError = Class.new(StandardError)

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Config.new
    yield configuration
  end

  class Config
    attr_accessor \
      :output_dir,
      :renderer

    def initialize
      @output_dir = 'docs'
      @renderer = :json
    end
  end
end
