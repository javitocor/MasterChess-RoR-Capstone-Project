class Gambit < ApplicationRecord
  # rubocop:disable  Layout/LineLength
  validates :text, presence: true, length: { maximum: 1000,
                                             too_long: '1000 characters in gambit is the maximum allowed.' }

  belongs_to :user

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def self.search(search)
    where('lower(users.username) LIKE :search OR lower(users.fullname) LIKE :search OR lower(gambits.text) LIKE :search', search: "%#{search.downcase}%")
  end
end
# rubocop:enable  Layout/LineLength
