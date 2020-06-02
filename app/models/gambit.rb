class Gambit < ApplicationRecord
  validates :text, presence: true, length: { maximum: 1000,
    too_long: '1000 characters in gambit is the maximum allowed.' }

  belongs_to :user

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  has_many :comments, dependent: :destroy
end
