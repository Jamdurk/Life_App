class Goal < ApplicationRecord
    # validations ensure the data must be present. No length limit here similar to the daily entries as these can be long.
    validates :goal_start,   presence: true
    validates :goal_end,     presence: true 
    validates :goal_content, presence: true
end
