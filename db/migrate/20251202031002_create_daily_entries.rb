class CreateDailyEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :daily_entries do |t|
      t.date :date
      t.text :day_content
      t.integer :mood

      t.timestamps
    end
  end
end
