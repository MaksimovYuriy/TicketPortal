# frozen_string_literal: true

module Auth
  class SignInService
    attr_reader :error, :result

    def initialize(email, password)
      @email = email
      @password = password
      @success = false
      @error = nil
      @result = nil
      @refresh_token = nil
    end

    def call
      agent = Agent.find_by(email: @email)

      if agent&.authenticate(@password)
        generate_refresh_token_for(agent)
        @result = {
          access_token: JwtToken.encode({ agent_id: agent.id }),
          refresh_token: @refresh_token,
          token_type: 'Bearer',
          expires_in: 15.minutes.to_i
        }
        @success = true
      else
        @error = error_message
      end

      self
    end

    def success?
      @success
    end

    private

    def error_message
      {
        message: 'Invalid email or password'
      }
    end

    def generate_refresh_token_for(agent)
      token = TokenGenerator.generate
      agent.refresh_tokens.create!(
        token_digest: TokenGenerator.digest(token),
        expires_at: TokenGenerator::LIFETIME.from_now
      )

      @refresh_token = token
    end
  end
end
