class User < ApplicationRecord
  has_many :long_goals
  has_many :short_goals

  validates :username, presence: true
  validates :password, presence: true
end
