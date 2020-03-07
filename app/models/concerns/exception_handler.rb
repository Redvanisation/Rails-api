module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    rescue_from ArgumentError do |e|
      json_response({ "error": "Tags parameter is required" }, :bad_request)
    end
  end
end