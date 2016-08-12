class CreateLongGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :long_goals do |t|
      t.string :goal
      t.string :duedate, :date
      t.string :image_url
      
      t.timestamps
    end
  end
end
