module APICop
  module OAuth2
    module Server
      class Token
        class AuthorizationCode < Abstract::Handler
          def call(env)
            @request  = Request.new(env)
            @response = Token::Response.new(request)
            super
          end

          class Request < Token::Request
            attr_required :code
            attr_optional :redirect_uri

            def initialize(env)
              super
              @grant_type   = :authorization_code
              @code         = params['code']
              @redirect_uri = params['redirect_uri']
              attr_missing!
            end
          end
        end
      end
    end
  end
end