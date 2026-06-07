# frozen_string_literal: true

module Auth
  class RefreshService
    attr_reader :error, :result

    def initialize(refresh_token)
      @refresh_token = refresh_token
      @new_refresh_token = nil
      @error = nil
      @result = nil
      @success = false
    end

    def call
      digest = TokenGenerator.digest(@refresh_token)
      token = RefreshToken.find_by(token_digest: digest)

      if token&.active?
        agent = token.agent
        token.revoke!
        generate_new_refresh_token_for(agent)
        @result = {
          access_token: JwtToken.encode({ agent_id: agent.id }),
          refresh_token: @new_refresh_token,
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

    def generate_new_refresh_token_for(agent)
      new_token = TokenGenerator.generate
      agent.refresh_tokens.create!(
        token_digest: TokenGenerator.digest(new_token),
        expires_at: TokenGenerator::LIFETIME.from_now
      )
      @new_refresh_token = new_token
    end

    def error_message
      {
        message: 'Invalid session'
      }
    end
  end
end
