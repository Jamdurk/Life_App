class Hobby < ApplicationRecord
    # validations ensure the data must be present. 
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :hobby_content, presence: true, length: { maximum: 150 }
end
