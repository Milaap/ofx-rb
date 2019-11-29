module Ofx
  class APIResource
    include Ofx::OfxObject

    def self.class_name
      self.name.split('::')[-1]
    end

    def self.resource_url(resource_id)
      "#{collection_url}/#{resource_id}"
    end

    def self.collection_url(resource_id = nil)
      if self == APIResource
        raise NotImplementedError.new('APIResource is an abstract class. You should perform actions on its subclasses (Account, Transfer, etc.)')
      end
      "/payments/#{CGI.escape(class_name.downcase)}s"
    end

    def self.create(params = {}, opts = {})
      response = Ofx::Client.request(:post, collection_url, params, opts)
      convert_to_ofx_object(response)
    end

    def self.list(headers = {}, filters = {}, resource_id: nil)
      response = Ofx::Client.request(:get, collection_url(resource_id), filters, headers)
      convert_to_ofx_object(response)
    end

    def self.get(resource_id, headers = {})
      response = Ofx::Client.request(:get, resource_url(resource_id), {}, headers)
      convert_to_ofx_object(response)
    end
  end
end
