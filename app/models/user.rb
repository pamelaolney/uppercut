class User < ApplicationRecord
  has_many :long_goals
  has_many :short_goals

  validates :username, presence: true
  validates :password, presence: true
  # awesome! if you want to check out password encryption for your app, this tutorial is supposedly good and fits with your users-from-scratch approach: https://www.sitepoint.com/rails-userpassword-authentication-from-scratch-part-i/
end
