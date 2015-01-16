module Unrest
  class PersistentObject < Hash
    extend JsonFetcher
    extend ResourceNameInvestigator
    include Hashie::Extensions::MethodAccess
    include Hashie::Extensions::Coercion

    def initialize(hash = {})
      super
      hash.each_pair do |k, v|
        self[k] = v
      end
    end

    class << self
      def find(id)
        response = fetch_json "#{Config[:base_uri]}/#{pluralized_resource_name}/#{id}"
        self.new response[singularized_resource_name]
      end

      def all(options={})
        response = fetch_json "#{Config[:base_uri]}/#{pluralized_resource_name}", options
        response[pluralized_resource_name].collect { |hash| new(hash) }
      end
    end
  end
end