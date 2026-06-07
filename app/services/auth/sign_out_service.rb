# frozen_string_literal: true

module Auth
  class SignOutService
    attr_reader :error

    def initialize(refresh_token)
      @refresh_token = refresh_token
      @success = false
      @error = nil
    end

    def call
      digest = TokenGenerator.digest(@refresh_token)

      token = RefreshToken.find_by(token_digest: digest)
      if token.active?
        token.revoke!
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
        message: 'Invalid session'
      }
    end
  end
end
