require 'unrest'
require 'pry'
require 'rspec/its'
require 'webmock/rspec'

Unrest::Config[:base_uri] = 'http://0.0.0.0:5555/api/v0'

module FixturesHelper
  def fixture(fixture_path)
    open(File.join('spec', 'fixtures', fixture_path)).read
  end
end

RSpec.configure do |config|
  config.include FixturesHelper
end