module Ofx
  class Authentication
    attr_accessor :access_token

    def initialize(client_id, client_secret)
      @client_id, @client_secret = client_id, client_secret
    end

    def get_access_token
      @access_token ||= fetch_auth_token["access_token"]
    end

    private

    def auth_request
      {
        url: "#{Ofx.api_base}/oauth/token",
        method: "post",
        payload: "grant_type=client_credentials&client_id=#{@client_id}&client_secret=#{@client_secret}&scope=payments",
        headers:{
          'Content-Type' => 'application/x-www-form-urlencoded'
        }
      }
    end

    def fetch_auth_token
      response = RestClient::Request.execute(auth_request)
      JSON.parse(response)
    end

  end
end
