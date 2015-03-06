require 'uri'

module Users
  module OmniauthCallbacksHelper

    def accepting_invatation
      !!state_params['invitation_token']
    end

    def state_params
      param_string = URI.decode(request.params[:state])
      Rack::Utils.parse_nested_query(param_string)
    end
  end
end
