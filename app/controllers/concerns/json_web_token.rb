module JsonWebToken
    # https://www.bluebash.co/blog/rails-6-7-api-authentication-with-jwt/#:~:text=What%20is%20JWT%3F,method%20of%20session%2Dbased%20authentication.
    extend ActiveSupport::Concern
    SECRET_KEY = Rails.application.secret_key_base

    def jwt_encode(payload, exp = 7.days.from_now)
        payload[:exp] = exp.to_i
        JWT.encode payload, SECRET_KEY, 'HS256'
    end

    def jwt_decode(token)
        begin
            decoded = JWT.decode token, SECRET_KEY, true, { algorithm: 'HS256' }
            decoded[0]['admin_id']
        rescue
            false
        end
        # HashWithIndifferentAccess.new decoded
    end
end