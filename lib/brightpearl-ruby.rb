require "brightpearl-ruby/version"
require "brightpearl-ruby/configuration"
require "brightpearl-ruby/service"

# defining blank here instead of using the whole of ActiveSupport...
# other suggestions welcome ;)

unless Object.respond_to?(:blank?)
  Object.class_eval do
    def blank?
      respond_to?(:empty?) ? !!empty? : !self
    end
  end
end

module Brightpearl

  class AuthException < StandardError; end
  class BrightpearlException < StandardError; end
  class ThrottleException < StandardError; end
  class DatabaseException < StandardError; end

  class << self
    attr_accessor :configuration


    def configure(instance_id = nil)
      instance_id ||= :default
      self.configuration[instance_id] ||= Configuration.instance(instance_id)
      yield(configuration[instance_id])
    end

  end

  self.configuration = {}

end