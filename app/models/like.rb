class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :gambit_id }

  belongs_to :user
  belongs_to :gambit
end
