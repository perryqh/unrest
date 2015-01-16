module Unrest
  module ResourceNameInvestigator
    def pluralized_resource_name
      singularized_resource_name.pluralize
    end

    def singularized_resource_name
      self.name.underscore
    end
  end
end