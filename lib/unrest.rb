require 'unrest/version'
require 'httparty'
require 'hashie'
require 'active_support/inflector'

module Unrest
  Config = {
      base_uri: 'required',
      headers: {'Content-Type' => 'application/json', 'Accept' => 'application/json'}
  }
end

require 'unrest/resource_name_investigator'
require 'unrest/json_fetcher'
require 'unrest/persistent_object'

