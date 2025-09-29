class ApiKey < ApplicationRecord
  before_create :generate_keys

  validates :access_token, presence: true, uniqueness: true
  validates :secret_key, presence: true, uniqueness: true

  private

  def generate_keys
    self.access_token ||= SecureRandom.hex(16) # 32 chars
    self.secret_key ||= SecureRandom.hex(32)   # 64 chars
  end
end
