# frozen_string_literal: true

module TokenGenerator
  LIFETIME = 30.days

  def self.generate
    SecureRandom.urlsafe_base64(64)
  end

  def self.digest(token)
    Digest::SHA256.hexdigest(token)
  end
end
