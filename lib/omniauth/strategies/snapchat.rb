require 'omniauth/strategies/oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Snapchat < OmniAuth::Strategies::OAuth2

      option :name, "snapchat"

      option :client_options, {
        site: 'https://adsapi.snapchat.com',
        authorize_url: 'https://accounts.snapchat.com/login/oauth2/authorize',
        token_url: 'https://accounts.snapchat.com/accounts/oauth2/token'
      }

      uid { raw_info['me']['id'] }

      info do
        {
          email: raw_info['me']['email'],
          organization_id: raw_info['me']['organization_id'],
          display_name: raw_info['me']['display_name'],
          member_status: raw_info['me']['member_status']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        raw_info_url = "https://adsapi.snapchat.com/v1/me"
        @raw_info ||= access_token.get(raw_info_url).parsed
      end

      def callback_url
        options[:redirect_uri] || full_host + script_name + callback_path
      end

      def token_params
        authorization = Base64.strict_encode64("#{options.client_id}:#{options.client_secret}")
        super.merge({
          headers: {
            "Authorization" => "Basic #{authorization}"
          }
        })
      end
    end
  end
end