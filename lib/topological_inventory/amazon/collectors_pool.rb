require "topological_inventory-ingress_api-client/collectors_pool"
require "topological_inventory/amazon/collector"
require "topological_inventory/amazon/logging"

module TopologicalInventory::Amazon
  class CollectorsPool < TopologicalInventoryIngressApiClient::CollectorsPool
    include Logging

    def initialize(config_name, metrics, poll_time: 10)
      super
    end

    def path_to_config
      File.expand_path("../../../config", File.dirname(__FILE__))
    end

    def path_to_secrets
      File.expand_path("../../../secret", File.dirname(__FILE__))
    end

    def new_collector(source, secret)
      TopologicalInventory::Amazon::Collector.new(source.source, secret['username'], secret['password'], metrics)
    end
  end
end
