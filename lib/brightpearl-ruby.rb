require 'brightpearl-ruby/version'
require 'brightpearl-ruby/configuration'
require 'brightpearl-ruby/service'

# defining blank here instead of using the whole of ActiveSupport...
# other suggestions welcome ;)

unless Object.respond_to?(:blank?)
  Object.class_eval do
    def blank?
      respond_to?(:empty?) ? empty? : !self
    end
  end
end

# Main Brightpearl module (other classes will reside in here...)
module Brightpearl
  class AuthException < StandardError; end
  class BrightpearlException < StandardError; end
  class ThrottleException < StandardError; end
  class DatabaseException < StandardError; end

  class << self
    attr_accessor :configuration

    def configure(instance_id = nil)
      instance_id ||= :default
      configuration[instance_id] ||= Configuration.instance(instance_id)
      yield(configuration[instance_id])
      configuration[instance_id]
    end

    # This method really only exists for isolation in tests...
    def reset!
      self.configuration = {}
      Brightpearl::Service.reset!
      Brightpearl::Configuration.reset!
    end
  end

  self.configuration = {}
end
