module Ofx
  class Beneficiary < APIResource
    def self.collection_url(resource_id = nil)
      "/payments/beneficiaries"
    end
  end
end
