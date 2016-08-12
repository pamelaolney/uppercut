class CreateShortGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :short_goals do |t|
      t.string :goal
      t.string :scheduled_date, :date
      t.string :location
      t.references :long_goal
      t.timestamps
    end
  end
end
