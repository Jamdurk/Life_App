class Hobby < ApplicationRecord
    # validations ensure the data must be present. No end date as hobbies may be current.
    validates :hobby_content, presence: true, length: { maximum: 150 }
    validates :start_date, presence: true
    
end
