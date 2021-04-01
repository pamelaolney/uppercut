class AddUsersToLongGoalsAndShortGoals < ActiveRecord::Migration[5.0]
  def change
    add_column :long_goals, :user_id, :integer
    add_column :short_goals, :user_id, :integer
    # magnificent migration
  end
end
