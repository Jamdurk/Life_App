class DailyEntry < ApplicationRecord
    # validations ensure the data must be present. No limit is given since the entries will be quite long most likely.
    validates :date, presence: true 
    validates :day_content, presence: true
    validates :mood, presence: true, inclusion: { in: [1, 2, 3] }
end
