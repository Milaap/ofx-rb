require "ofx/version"

require "rest-client"
require "json"

require "extentions/string"
require "ofx/ofx_object"
require "ofx/authentication"
require "ofx/client"
require "ofx/api_resource"
require "ofx/beneficiary"
require "ofx/quote"
require "ofx/deal"
require "ofx/ofx_error"

module Ofx
  class << self
    attr_accessor :mode
    attr_accessor :access_token
    def api_base
      @api_base ||= mode == 'live' ? 'https://live.api.ofx.com' : 'https://sandbox.api.ofx.com/v1'
    end
  end
end
