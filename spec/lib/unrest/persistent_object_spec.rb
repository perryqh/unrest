require 'spec_helper'

class PersistentObjectDummy < Unrest::PersistentObject

end

describe PersistentObjectDummy do
  let(:base_uri) { Unrest::Config[:base_uri] }
  let(:persistent_object_dummy_id) { '11' }
  let(:response_json) { fixture('find-dummy.json') }
  let(:expected_hash) { JSON.parse(response_json)['persistent_object_dummy'] }

  describe :find do
    subject { PersistentObjectDummy.find(persistent_object_dummy_id) }

    before do
      stub_request(:get, "#{base_uri}/persistent_object_dummies/#{persistent_object_dummy_id}").to_return(body: response_json, status: 200)
    end

    its(:uid) { is_expected.to eq(expected_hash['uid']) }
    its(:urn) { is_expected.to eq(expected_hash['urn']) }
    its(:foo) { is_expected.to eq(expected_hash['foo']) }
    its(:updated_at) { is_expected.to eq(expected_hash['updated_at']) }
  end
end

