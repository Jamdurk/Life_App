class Goal < ApplicationRecord
    # validations ensure the data must be present. No length limit here similar to the daily entries as these can be long.
    # Also no dates, as our goals may be long term or not having a specific start and end date.
    validates :goal_content, presence: true, length: { maximum: 150 }
    validates :goal_start, presence: true
end
