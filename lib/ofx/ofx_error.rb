module Ofx

  STATUS_CLASS_MAPPING = {
    400 => "InvalidRequestError",
    404 => "InvalidRequestError",
    401 => "AuthenticationError"
  }

  class OfxError < StandardError
    attr_reader :message, :http_status, :http_body, :http_headers, :json_body

    def initialize(params = {})
      params.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def to_s
      status_string = @http_status.nil? ? "" : "(Status #{@http_status}) "
      "#{status_string}#{@message}"
    end
  end

  class APIConnectionError < OfxError
  end

  class APIError < OfxError
  end

  class AuthenticationError < OfxError
  end

  class InvalidRequestError < OfxError
  end

  class ParseError < OfxError
  end

end
