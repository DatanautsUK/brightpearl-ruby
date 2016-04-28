module Brightpearl
  # Brightpearl::Configuration
  class Configuration
    attr_accessor :datacenter, :account, :app_ref, :account_token

    @instances = {}

    def initialize(instance_id = :default)
      # if no instance_id is supplied (single Brightpearl application) then
      # .... we can just use the environment variables to configure it...
      return unless instance_id == :default

      self.datacenter = ENV['BRIGHTPEARL_DATACENTER']
      self.account = ENV['BRIGHTPEARL_ACCOUNT']
      self.app_ref = ENV['BRIGHTPEARL_APP_REF']
      self.account_token = ENV['BRIGHTPEARL_ACCOUNT_TOKEN']
    end

    def valid?
      !invalid?
    end

    def invalid?
      [:datacenter, :account, :app_ref, :account_token].any? do |v|
        send(v).blank?
      end
    end

    def uri(path)
      "https://#{@datacenter}.brightpearl.com/public-api/#{@account}#{path}"
    end

    class << self
      private :new

      # this is "like" the singleton pattern,
      # but we allow multiple instances referenced by "instance_id"
      def instance(instance_id = :default)
        @instances[instance_id] ||= new(instance_id)
        if bad_instance?(instance_id)
          raise BrightpearlException,
                'Cannot use default instance when others have been defined'
        end

        @instances[instance_id]
      end

      def reset!
        @instances = {}
      end

      def bad_instance?(instance_id)
        instance_id == :default && @instances.keys.length != 1
      end
    end
  end
end
