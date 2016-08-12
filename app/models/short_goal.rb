class ShortGoal < ApplicationRecord
  belongs_to :long_goal
  belongs_to :user
end
