# frozen_string_literal: true

module JwtToken
  SECRET_KEY = Rails.application.credentials.secret_key_base
  ALGORITHM = 'HS256'

  def self.encode(payload, exp: 15.minutes.from_now)
    payload = payload.merge(exp: exp.to_i)
    JWT.encode(payload, SECRET_KEY, ALGORITHM)
  end

  def self.decode(jwt)
    decoded = JWT.decode(jwt, SECRET_KEY, true, algorithm: ALGORITHM)
    decoded[0].with_indifferent_access
  end
end
