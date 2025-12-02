class CreateHobbies < ActiveRecord::Migration[7.2]
  def change
    create_table :hobbies do |t|
      t.date :start_date
      t.date :end_date
      t.text :hobby_content

      t.timestamps
    end
  end
end
