class TimeStudy < ApplicationRecord
  belongs_to :work

  with_options presence: true do
    validates :start_time
    validates :ending_time
  end

end
