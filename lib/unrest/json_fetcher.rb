module Unrest
  module JsonFetcher
    def fetch_json(uri, options={})
      headers  = options[:headers] || Config[:headers]
      response = HTTParty.get(uri, headers)
      JSON.parse(response)
    end
  end
end