class CreateGoals < ActiveRecord::Migration[7.2]
  def change
    create_table :goals do |t|
      t.date :goal_start
      t.date :goal_end
      t.text :goal_content

      t.timestamps
    end
  end
end
