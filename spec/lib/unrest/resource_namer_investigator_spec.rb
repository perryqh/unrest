require 'spec_helper'

describe Unrest::ResourceNameInvestigator do
  def resource_name_dynamic_class(dynamic_name)
    already_defined = eval("#{dynamic_name}") rescue nil
    return already_defined if already_defined
    the_class    = Class.new do
      extend Unrest::ResourceNameInvestigator
    end
    Object.const_set(dynamic_name, the_class)
    eval("#{dynamic_name}")
  end

  [{class_name: 'Target', pluralized_resource_name: 'targets', singularized_resource_name: 'target'},
   {class_name: 'SwampThing', pluralized_resource_name: 'swamp_things', singularized_resource_name: 'swamp_thing'},
   {class_name: 'BigDummy', pluralized_resource_name: 'big_dummies', singularized_resource_name: 'big_dummy'}
  ].each do |test_hash|
    it "pluralized #{test_hash[:class_name]} to #{test_hash[:pluralized_resource_name]}" do
      expect(resource_name_dynamic_class(test_hash[:class_name]).pluralized_resource_name).to eq(test_hash[:pluralized_resource_name])
    end

    it "singularized #{test_hash[:class_name]} to #{test_hash[:singularized_resource_name]}" do
      expect(resource_name_dynamic_class(test_hash[:class_name]).singularized_resource_name).to eq(test_hash[:singularized_resource_name])
    end
  end
end