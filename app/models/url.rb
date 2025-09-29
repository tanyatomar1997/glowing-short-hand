class Url < ApplicationRecord
  before_validation :ensure_short_code, on: :create

  validates :original_url, presence: true, uniqueness: true, length: { maximum: 20_000 }
  validates :short_code, presence: true, uniqueness: true

  has_many :short_urls, class_name: "Url", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent_url, class_name: "Url", optional: true, foreign_key: "parent_id"

  def to_param
    short_code
  end

  private

  def ensure_short_code
    return if short_code.present?

    6.times do
      candidate = generate_code
      unless Url.exists?(short_code: candidate)
        self.short_code = candidate
        break
      end
    end

    self.short_code ||= "s#{SecureRandom.hex(4)}#{Time.now.to_i.to_s(36)}"
  end

  def generate_code
    SecureRandom.urlsafe_base64(4).tr('-_', 'xy')[0, 6]
  end
end
