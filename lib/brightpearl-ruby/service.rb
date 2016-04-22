module Brightpearl

  class Service

    @@instances = {}

    attr_accessor :configuration

    def initialize(instance_id)
      @configuration = Brightpearl::Configuration.instance(instance_id)
      raise BrightpearlException unless @configuration.valid?
    end
    
    def uri(path)
      configuration.uri(path)
    end

    class << self

      private :new

      # this is "like" the singleton pattern, but we allow multiple instances referenced by "instance_id"
      def instance(instance_id = :default)

        @@instances[instance_id] ||= new(instance_id)

      end

    end


  end

end