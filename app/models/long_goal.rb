class LongGoal < ApplicationRecord
  has_many :short_goals
  belongs_to :user

  validates :goal, presence: true
end
