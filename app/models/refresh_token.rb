# frozen_string_literal: true

class RefreshToken < ApplicationRecord
  belongs_to :agent

  validates :token_digest, presence: true, uniqueness: true
  validates :expires_at, presence: true

  def active?
    revoked_at.nil? && expires_at.future?
  end

  def revoke!
    update(revoked_at: Time.current)
  end
end
